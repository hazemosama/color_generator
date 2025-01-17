import 'package:flutter/material.dart';

/// A custom button container widget
class CustomButton extends StatelessWidget {
  /// Constructor for the [CustomButton] widget
  const CustomButton({
    required this.foregroundColor,
    required this.text,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  /// The foreground color of the button
  final Color foregroundColor;

  /// Button text
  final String text;

  /// Button Icon
  final IconData icon;

  /// Button Function
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 6,
        ),
        side: BorderSide(
          color: foregroundColor.withOpacity(0.6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
          ),
          const SizedBox(width: 5),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
