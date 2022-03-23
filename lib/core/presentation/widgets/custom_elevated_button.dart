import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.label,
    required this.onPressed,
  });
  final String label;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(
            screenWidth,
            .07 * screenHeight,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(label.toUpperCase()),
    );
  }
}
