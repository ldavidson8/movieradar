import 'package:flutter/material.dart';
import 'package:movieradar/theme_constants.dart';

class InputCard extends StatelessWidget {
  const InputCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.hintText,
    this.statusText = '',
    this.bottomContainerColor,
    this.trailing = const SizedBox.shrink(),
    this.hasInput = true,
    this.buttonText = 'Save',
  });
  final String title;
  final String subtitle;
  final String hintText;
  final Color? bottomContainerColor;
  final String statusText;
  final Widget trailing;
  final bool hasInput;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final Color containerColor =
        Theme.of(context).brightness == Brightness.light
            ? AppColors.lightBackgroundGrey
            : AppColors.darkBackground;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey[600]!, width: 1.0),
      ),
      color: Theme.of(context).cardColor,
      surfaceTintColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
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
                    ],
                  ),
                ),
                if (!hasInput) trailing,
              ],
            ),
          ),
          if (hasInput)
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      hintText: hintText,
                    ),
                  ),
                )),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerColor,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.lightBorderGrey
                      : AppColors.darkInputBorderColour,
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
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(buttonText,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
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
