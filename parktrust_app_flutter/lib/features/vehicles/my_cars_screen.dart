import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/plate_utils.dart';
import '../../providers/vehicles_provider.dart';
import '../../widgets/common.dart';

class MyCarsScreen extends ConsumerStatefulWidget {
  const MyCarsScreen({super.key});
  @override
  ConsumerState<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends ConsumerState<MyCarsScreen> {
  final _plate = TextEditingController();
  final _label = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _plate.dispose();
    _label.dispose();
    super.dispose();
  }

  Future<void> _add() async {
    setState(() => _busy = true);
    try {
      await ref.read(vehiclesProvider.notifier).add(_plate.text, _label.text);
      _plate.clear();
      _label.clear();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorText(e))));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _remove(int id) async {
    try {
      await ref.read(vehiclesProvider.notifier).remove(id);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorText(e))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehicles = ref.watch(vehiclesProvider);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Register your car', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        const Text(
          'If someone blocks the road with your car, they snap the plate and '
          'you get a live alert here. Your plate is only used to find you.',
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _plate,
          textCapitalization: TextCapitalization.characters,
          decoration: const InputDecoration(labelText: 'Number plate', hintText: 'MH12AB1234'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _label,
          decoration: const InputDecoration(labelText: 'Nickname (optional)', hintText: 'White Swift'),
        ),
        const SizedBox(height: 12),
        FilledButton(
          onPressed: _busy ? null : _add,
          child: _busy
              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Add car'),
        ),
        const SizedBox(height: 24),
        Text('My cars', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        vehicles.when(
          loading: () => const Padding(padding: EdgeInsets.all(24), child: LoadingView()),
          error: (e, _) => ErrorView(
            message: errorText(e),
            onRetry: () => ref.invalidate(vehiclesProvider),
          ),
          data: (list) => list.isEmpty
              ? const EmptyView(
                  icon: Icons.directions_car,
                  title: 'No cars yet',
                  text: 'Add your plate above so people can reach you.',
                )
              : Column(
                  children: [
                    for (final v in list)
                      Card(
                        child: ListTile(
                          leading: PlateBadge(v.plate),
                          title: Text(v.label ?? 'My car'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            tooltip: 'Remove',
                            onPressed: () => _remove(v.id!),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}
