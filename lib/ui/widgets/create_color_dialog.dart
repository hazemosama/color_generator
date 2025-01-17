import 'package:color_generator/ui/widgets/color_input_field.dart';
import 'package:flutter/material.dart';

/// A dialog that allows the user to create a custom color
class CreateColorDialog extends StatefulWidget {
  /// Constructor for the [CreateColorDialog] widget
  const CreateColorDialog({
    required this.onCreateColor,
    super.key,
  });

  /// Function to be called when color is created
  final Function(Color newColor) onCreateColor;

  @override
  State<CreateColorDialog> createState() => _CreateColorDialogState();
}

class _CreateColorDialogState extends State<CreateColorDialog> {
  /// Controller for the red color value
  TextEditingController redController = TextEditingController();

  /// Controller for the green color value
  TextEditingController greenController = TextEditingController();

  /// Controller for the blue color value
  TextEditingController blueController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Enter the RGB values for the color',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorInputField(
                color: Colors.red,
                valueController: redController,
              ),
              const SizedBox(width: 10),
              ColorInputField(
                color: Colors.green,
                valueController: greenController,
              ),
              const SizedBox(width: 10),
              ColorInputField(
                color: Colors.blue,
                valueController: blueController,
              ),
            ],
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            final newColor = Color.fromARGB(
              255,
              int.parse(redController.text),
              int.parse(greenController.text),
              int.parse(blueController.text),
            );
            widget.onCreateColor(newColor);
            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
