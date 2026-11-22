import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/plate_utils.dart';
import '../../providers/market_provider.dart';
import '../../widgets/common.dart';

/// Owner: the QR at the gate. Drivers scan it to check in and out.
class OwnerQrScreen extends ConsumerWidget {
  const OwnerQrScreen({super.key, required this.listingId, required this.title});
  final int listingId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qr = ref.watch(ownerQrProvider(listingId));
    return Scaffold(
      appBar: AppBar(title: const Text('GATE QR')),
      body: qr.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: errorText(e),
          onRetry: () => ref.invalidate(ownerQrProvider(listingId)),
        ),
        data: (code) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12),
                child: QrImageView(data: code, size: 240, backgroundColor: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Print this or keep it at the gate. Drivers scan it when they arrive and when they leave.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              SelectableText(code, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

/// Driver: scan the owner's QR. Pops with the scanned text. If the camera
/// cannot read it, the code can be typed. Demo spaces accept PT1:DEMO.
class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key, required this.demoSpace});
  final bool demoSpace;
  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final _manual = TextEditingController();
  bool _done = false;

  @override
  void dispose() {
    _manual.dispose();
    super.dispose();
  }

  void _finish(String code) {
    if (_done || code.trim().isEmpty) return;
    _done = true;
    Navigator.of(context).pop(code.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SCAN GATE QR')),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: (capture) {
                for (final b in capture.barcodes) {
                  final v = b.rawValue;
                  if (v != null) {
                    _finish(v);
                    return;
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('Point the camera at the owner\'s QR. We only use the camera for this scan.'),
                const SizedBox(height: 8),
                TextField(
                  controller: _manual,
                  decoration: InputDecoration(
                    labelText: 'Or type the code under the QR',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () => _finish(_manual.text),
                    ),
                  ),
                ),
                if (widget.demoSpace)
                  TextButton(
                    onPressed: () => _finish('PT1:DEMO'),
                    child: const Text('Demo space: simulate scan'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
