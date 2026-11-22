import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../../core/plate_utils.dart';
import '../../providers/alerts_provider.dart';
import '../../providers/client_provider.dart';
import '../../widgets/common.dart';
import '../alerts/alert_detail_screen.dart';
import 'plate_reader.dart';

/// Feature 2: snap the blocking car. Photo, plate read on the phone, GPS.
class SnapScreen extends ConsumerStatefulWidget {
  const SnapScreen({super.key});
  @override
  ConsumerState<SnapScreen> createState() => _SnapScreenState();
}

class _SnapScreenState extends ConsumerState<SnapScreen> {
  static const _maxPhotoBytes = 280 * 1024;
  final _plate = TextEditingController();
  final _note = TextEditingController();
  Uint8List? _photo;
  Position? _position;
  bool _reading = false;
  bool _sending = false;
  String? _hint;
  BlockAlert? _sent;

  @override
  void dispose() {
    _plate.dispose();
    _note.dispose();
    super.dispose();
  }

  void _toast(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _snap() async {
    final XFile? file;
    try {
      file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 900,
        imageQuality: 55,
      );
    } catch (_) {
      _toast('Could not open the camera. You can still type the plate.');
      return;
    }
    if (file == null) return;
    final bytes = await file.readAsBytes();
    setState(() {
      _photo = bytes.length <= _maxPhotoBytes ? bytes : null;
      _reading = true;
      _hint = null;
      _sent = null;
    });
    if (bytes.length > _maxPhotoBytes) {
      _toast('Photo too large to send, the alert will go without it.');
    }
    _grabLocation();
    final read = await readPlateFromImage(file.path);
    if (!mounted) return;
    setState(() {
      _reading = false;
      if (read != null) {
        _plate.text = read;
        _hint = 'Plate read from the photo. Please check it.';
      } else {
        _hint = 'Could not read the plate. Please type it.';
      }
    });
  }

  Future<void> _grabLocation() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return;
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 8),
        ),
      );
      if (mounted) setState(() => _position = pos);
    } catch (_) {
      // Location is optional; the alert works without it.
    }
  }

  Future<void> _send() async {
    setState(() => _sending = true);
    try {
      final photo = _photo;
      final alert = await ref.read(clientProvider).alert.createAlert(
        _plate.text,
        _position?.latitude,
        _position?.longitude,
        photo == null ? null : ByteData.view(photo.buffer, photo.offsetInBytes, photo.length),
        _note.text,
      );
      ref.invalidate(sentAlertsProvider);
      if (mounted) setState(() => _sent = alert);
    } catch (e) {
      _toast(errorText(e));
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _reset() {
    setState(() {
      _plate.clear();
      _note.clear();
      _photo = null;
      _position = null;
      _hint = null;
      _sent = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sent = _sent;
    if (sent != null) return _SentView(alert: sent, onAnother: _reset);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Someone blocking you?', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        const Text('Snap the number plate. The owner gets a live alert.'),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: _reading ? null : _snap,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: _photo != null
                ? Image.memory(_photo!, fit: BoxFit.cover, width: double.infinity)
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_camera, size: 56),
                      SizedBox(height: 8),
                      Text('Tap to snap the car'),
                    ],
                  ),
          ),
        ),
        if (_reading)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: LinearProgressIndicator(),
          ),
        const SizedBox(height: 16),
        TextField(
          controller: _plate,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            labelText: 'Number plate',
            hintText: 'MH12AB1234',
            helperText: _hint,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _note,
          maxLength: 200,
          decoration: const InputDecoration(labelText: 'Note (optional)', hintText: 'Blocking gate 2'),
        ),
        Row(
          children: [
            Icon(
              _position == null ? Icons.location_off : Icons.location_on,
              size: 18,
              color: _position == null ? null : Colors.greenAccent,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                _position == null
                    ? 'Location is added after you snap, to show the owner where you are. Allow it when asked.'
                    : 'Location attached.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: (_sending || _reading) ? null : _send,
          icon: _sending
              ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.notifications_active),
          label: const Text('Alert the owner'),
        ),
      ],
    );
  }
}

class _SentView extends StatelessWidget {
  const _SentView({required this.alert, required this.onAnother});
  final BlockAlert alert;
  final VoidCallback onAnother;

  @override
  Widget build(BuildContext context) {
    final delivered = alert.ownerId != null;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(delivered ? Icons.check_circle : Icons.hourglass_top, size: 72,
              color: delivered ? Colors.greenAccent : Colors.amber),
          const SizedBox(height: 16),
          PlateBadge(alert.plate, big: true),
          const SizedBox(height: 16),
          Text(
            delivered
                ? 'Alert delivered live to the owner.'
                : 'No owner has registered this plate yet. The alert will wait for one hour in case they do.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => AlertDetailScreen(alertId: alert.id!)),
            ),
            child: const Text('Watch for the reply'),
          ),
          const SizedBox(height: 8),
          TextButton(onPressed: onAnother, child: const Text('Report another car')),
        ],
      ),
    );
  }
}
