
import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const MenuItem({required this.imagePath, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center, // Align text to center
            ),
          ],
        ),
      ),
    );
  }
}
