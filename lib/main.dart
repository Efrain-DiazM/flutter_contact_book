import 'package:flutter/material.dart';
import 'package:taller_manejo_getx/screens/contact_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My contact book',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: ContactScreen(),
    );
  }
}
