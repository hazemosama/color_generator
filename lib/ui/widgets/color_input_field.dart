import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field for entering color values and indicates the color
class ColorInputField extends StatelessWidget {
  /// Constructor for the [ColorInputField] widget
  const ColorInputField({
    required this.color,
    required this.valueController,
    super.key,
  });

  /// The color to be indicated
  final Color color;

  /// Controller for the text field
  final TextEditingController valueController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: BoxDecoration(
        color: color.withOpacity(0.02),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          TextField(
            controller: valueController,
            decoration: const InputDecoration(
              hintText: '0-255',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            onChanged: (value) {
              final intValue = int.parse(value);
              if (intValue > 255) {
                valueController.text = '255';
              } else if (intValue < 0) {
                valueController.text = '0';
              }
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 10,
          color: color,
          ),
        ],
      ),
    );
  }
}
