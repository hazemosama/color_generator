import 'package:color_generator/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

/// The main application widget.
class Main extends StatelessWidget {

  /// Constructor for the [Main] widget
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Generator',
      home: HomeScreen(),
    );
  }
}
