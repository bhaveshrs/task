import 'package:flutter/material.dart';
import 'package:number_selector/num_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        primarySwatch: Colors.cyan,
      ),
      home: const NumSelectionScreen(),
    );
  }
}
