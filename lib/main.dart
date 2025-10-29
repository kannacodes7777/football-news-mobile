import 'package:flutter/material.dart';
import 'package:football_news/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Using fromSeed is the more modern approach, but your
        // fromSwatch code is also fine.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
          secondary: Colors.blueAccent[400],
        ),
        useMaterial3: true, // Recommended for modern Flutter UI
      ),
      // Fix 4: This call is now valid because we fixed the
      // MyHomePage constructor in menu.dart.
      home: MyHomePage(),
    );
  }
}