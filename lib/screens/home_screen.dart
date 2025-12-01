// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:tarif_defteri/screens/favorites_screen.dart';
import '../models/recipe.dart';
import '../widgets/recipe_card.dart'; // Yeni widget'ımızı import ettik

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bugün Ne Pişirsem?'),
        backgroundColor: Colors.orange,
        actions: [
          // Favoriler ikonunu ekliyoruz
          IconButton(
            icon: const Icon(Icons.favorite),
            color: Colors.white, // Turuncu üstünde beyaz güzel durur
            onPressed: () {
              // Favoriler sayfasına git
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: dummyRecipes.length,
        itemBuilder: (context, index) {
          final recipe = dummyRecipes[index];
          
          
          return RecipeCard(recipe: recipe); 
        },
      ),
    );
  }
}