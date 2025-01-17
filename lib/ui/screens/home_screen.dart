import 'package:color_generator/core/utils/color_utils.dart';
import 'package:color_generator/ui/widgets/create_color_dialog.dart';
import 'package:color_generator/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is the home screen of the application
class HomeScreen extends StatefulWidget {
  /// Constructor for the [HomeScreen] widget
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color backgroundColor = Colors.white;
  Color foregroundColor = Colors.black;

  void _setBackgroundColor({Color? newColor}) {
    setState(() {
      backgroundColor = newColor ?? generateRandomColor();
      foregroundColor = generateForegroundColor(backgroundColor);
    });
  }

  void _resetColor() {
    setState(() {
      backgroundColor = Colors.white;
      foregroundColor = Colors.black;
    });
  }

  void _copyCurrentColor() {
    Clipboard.setData(
      ClipboardData(
        text:
            '''RGB color: (${backgroundColor.red}, ${backgroundColor.green}, ${backgroundColor.blue})''',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Color copied to clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _createCustomColor() {
    showDialog(
      context: context,
      builder: (_) {
        return CreateColorDialog(
          onCreateColor: (newColor) => _setBackgroundColor(newColor: newColor),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CustomButton(
              foregroundColor: foregroundColor,
              icon: Icons.refresh,
              text: 'RESET',
              onPressed: _resetColor,
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: foregroundColor == Colors.black
              ? Brightness.dark
              : Brightness.light,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _setBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 26,
                  color: foregroundColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '''color (RGB): (${backgroundColor.red} - ${backgroundColor.green} - ${backgroundColor.blue})''',
                style: TextStyle(
                  color: foregroundColor,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: _copyCurrentColor,
                icon: Icons.copy,
                text: 'Copy Color',
                foregroundColor: foregroundColor,
              ),
              const SizedBox(height: 16),
              CustomButton(
                foregroundColor: foregroundColor,
                icon: Icons.color_lens_outlined,
                text: 'Custom Color',
                onPressed: _createCustomColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
