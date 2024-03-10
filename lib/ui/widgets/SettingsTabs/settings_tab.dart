import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/toggle_card.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                ToggleSwitchCard(
                  title: 'Show Comments on Movie',
                  statusText: 'Show/Hide comments on movie page',
                  subtitle: 'Enable/Disable comments',
                  value: true,
                  bottomContainerColor: Colors.black,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
