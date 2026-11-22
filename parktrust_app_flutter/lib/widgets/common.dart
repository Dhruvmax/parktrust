import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parktrust_app_client/parktrust_app_client.dart';

import '../app/theme.dart';

/// Number plate look: yellow plate, black condensed letters.
class PlateBadge extends StatelessWidget {
  const PlateBadge(this.plate, {super.key, this.big = false});
  final String plate;
  final bool big;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: big ? 18 : 10, vertical: big ? 8 : 4),
      decoration: BoxDecoration(
        color: safetyYellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        plate,
        style: GoogleFonts.barlowCondensed(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
          fontSize: big ? 32 : 20,
        ),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip(this.status, {super.key});
  final AlertStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      AlertStatus.open => ('WAITING', alertRed),
      AlertStatus.acknowledged => ('OWNER REPLIED', safetyYellow),
      AlertStatus.resolved => ('RESOLVED', okGreen),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 12),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 48, color: alertRed),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });
  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: safetyYellow),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
