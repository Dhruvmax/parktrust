import 'package:flutter/material.dart';

import '../lots/lots_screen.dart';
import '../market/find_spots_screen.dart';

/// Two ways to find parking: spaces drivers list, and public lots.
class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});
  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  int _mode = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, label: Text('Find a space'), icon: Icon(Icons.home_work)),
              ButtonSegment(value: 1, label: Text('Public lots'), icon: Icon(Icons.local_parking)),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() => _mode = s.first),
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: _mode,
            children: const [FindSpotsScreen(), LotsScreen()],
          ),
        ),
      ],
    );
  }
}
