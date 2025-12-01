

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';
import '../widgets/recipe_card.dart'; // Kart tasarımını tekrar kullanıyoruz!

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Provider'ı dinle
    final provider = Provider.of<RecipeProvider>(context);
    final favIds = provider.favoriteIds;

    // 2. Listeyi filtrele (ID'si favoriler listesinde olanları bul)
    // where: Dart dilinde filtreleme komutudur.
    final favoriteRecipes = dummyRecipes.where((recipe) {
      return favIds.contains(recipe.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorilerim'),
      ),
      // 3. Liste boşsa uyarı ver, doluysa listeyi göster
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text(
                'Henüz favori eklemedin.\nHadi gidip biraz yemek seç! 🍕',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(recipe: favoriteRecipes[index]);
              },
            ),
    );
  }
}