

import 'package:flutter/material.dart';

// ChangeNotifier: Değişiklik olduğunda "Ben değiştim!" diye bağıran sınıftır.
class RecipeProvider with ChangeNotifier {
  
  // Favoriye eklenen tariflerin ID'lerini burada tutacağız.
  // Örneğin: ['r1', 'r3']
  final List<String> _favoriteIds = [];

  // Dışarıdan listeye sadece okuma amaçlı erişilsin (Güvenlik)
  List<String> get favoriteIds => _favoriteIds;

  // Favori durumunu değiştiren fonksiyon (Ekle/Çıkar)
  void toggleFavorite(String recipeId) {
    if (_favoriteIds.contains(recipeId)) {
      _favoriteIds.remove(recipeId); // Zaten varsa çıkar
    } else {
      _favoriteIds.add(recipeId); // Yoksa ekle
    }
    
    // EN ÖNEMLİ SATIR: Dinleyen tüm sayfalara "Ekranı güncelle!" der.
    notifyListeners(); 
  }

  // Bir tarif favori mi değil mi kontrolü
  bool isFavorite(String recipeId) {
    return _favoriteIds.contains(recipeId);
  }
}