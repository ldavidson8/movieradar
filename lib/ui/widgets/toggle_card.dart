import 'package:flutter/material.dart';

class ToggleSwitchCard extends StatelessWidget {
  const ToggleSwitchCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.statusText,
    required this.value,
    required this.onChanged,
    this.bottomContainerColor,
    this.buttonText = 'Save',
  });

  final String title;
  final String subtitle;
  final String statusText;
  final Color? bottomContainerColor;
  final String buttonText;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final Color? containerColor = bottomContainerColor ?? Colors.grey[400];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey[600]!, width: 1.0),
      ),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(subtitle),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Switch(value: value, onChanged: onChanged),
                    const SizedBox(width: 12),
                    Text(
                      value ? 'On' : 'Off',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerColor,
              border: const Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey,
                ),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        statusText,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      backgroundColor:
                          Theme.of(context).buttonTheme.colorScheme!.primary,
                      foregroundColor: Theme.of(context)
                          .buttonTheme
                          .colorScheme!
                          .inversePrimary,
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
