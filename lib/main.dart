import 'package:expance_tracker/Widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolorschame =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 238, 172, 249));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kcolorschame,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kcolorschame.onPrimaryContainer,
              foregroundColor: kcolorschame.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: kcolorschame.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kcolorschame.primaryContainer,
          ))),
      home: const Expenses(),
    );
  }
}
