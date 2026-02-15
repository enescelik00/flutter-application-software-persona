// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SwiftShopApp());
}

class SwiftShopApp extends StatelessWidget {
  const SwiftShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swift Shop',

      // Theme Settings
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7043),
          primary: const Color(0xFFFF7043),
          secondary: const Color(0xFF263238),
          surface: Colors.white,
        ),

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF263238),
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: Color(0xFF263238)),
        ),

        // Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF7043),
            foregroundColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        ),

        // Texts
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF263238),
            fontWeight: FontWeight.w800,
          ), // Headers
          bodyMedium: TextStyle(color: Color(0xFF455A64)), // Açıklamalar (Gri)
          bodyLarge: TextStyle(
            color: Color(0xFF263238),
            fontWeight: FontWeight.w600,
          ), // Prices
        ),
      ),

      home: const HomeScreen(),
    );
  }
}
