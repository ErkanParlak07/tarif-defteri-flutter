// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // EKLENDİ
import 'screens/home_screen.dart';
import 'providers/recipe_provider.dart'; // EKLENDİ

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp'i ChangeNotifierProvider ile sarmalıyoruz
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(), // Provider'ı başlattık
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tarif Defteri',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}