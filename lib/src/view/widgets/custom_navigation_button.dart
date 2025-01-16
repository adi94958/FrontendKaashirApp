import 'package:flutter/material.dart';

class CustomNavigationButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rightText;
  final VoidCallback onTap;

  const CustomNavigationButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.rightText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(
              rightText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.navigate_next, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
