// lib/widgets/recipe_card.dart

import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_detail_screen.dart'; // Navigasyon için gerekli

class RecipeCard extends StatelessWidget {
  // Bu widget dışarıdan bir tarif almak zorunda
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            // Resim Alanı
            ClipRRect( // Resmi kartın köşelerine uygun yuvarlar
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                recipe.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                cacheHeight: 200 * 2, // Kart yüksekliği 200, retina ekranlar için 2 katı (400px) yeterli.
                cacheWidth: 400 * 2,  // Genişlik için de ortalama bir değer
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                      height: 200,
                      color: Colors.grey,
                      child: const Center(child: Icon(Icons.broken_image))
                  );
                },
              ),
            ),
            // Yazı Alanı
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text('${recipe.duration} dk'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}