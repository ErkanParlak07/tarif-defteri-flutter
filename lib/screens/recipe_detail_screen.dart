// lib/screens/recipe_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarif_defteri/providers/recipe_provider.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  // 1. Bu sayfa açılırken bana bir tarif ver diyoruz
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    // Provider'a erişiyoruz
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final isFav = recipeProvider.isFavorite(recipe.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title), // AppBar'da yemeğin adı yazsın
        actions: [
          // KALP İKONU
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : null,
            ),
            onPressed: () {
              // Tıklanınca provider'daki fonksiyonu çalıştır
              recipeProvider.toggleFavorite(recipe.id);
            },
          ),
        ],
      ),
      // Sayfa içeriği uzun olabilir, kaydırılabilir yapalım (SingleChildScrollView)
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Büyük Resim
            Image.network(
              recipe.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              cacheHeight: 300 * 2,
            ),
            const SizedBox(height: 14),
            
            // Malzemeler Başlığı
            const Text(
              'Malzemeler',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            
            // Malzemeler Listesi
            // Column içine liste koyarken map kullanmak pratik bir yöntemdir.
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.ingredients.map((item) => Card(
                  color: Colors.orange.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('• $item', style: const TextStyle(fontSize: 16)),
                  ),
                )).toList(),
              ),
            ),

            const SizedBox(height: 20),
            const Divider(), // Araya çizgi çekelim
            const SizedBox(height: 20),

            // Yapılış Başlığı
            const Text(
              'Hazırlanışı',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            
            // Yapılış Metni
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                recipe.steps,
                style: const TextStyle(fontSize: 16, height: 1.5), // Satır aralığını açtık, okuması kolay olsun
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50), // En altta biraz boşluk kalsın
          ],
        ),
      ),
    );
  }
}