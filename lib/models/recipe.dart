

class Recipe {
  // 1. Özellikleri (Fields) Tanımlıyoruz
  final String id;
  final String title;
  final String imageUrl; // İnternetten çekeceğimiz resim linki
  final List<String> ingredients; // Malzemeler listesi
  final String steps; // Yapılış adımları
  final int duration; // Hazırlama süresi (dakika)

  // 2. Kurucu Metodu (Constructor) Yazıyoruz
  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
  });
}



// lib/models/recipe.dart

List<Recipe> dummyRecipes = [
  const Recipe(
    id: 'r1',
    title: 'Mercimek Çorbası',
    imageUrl: 'https://cdn.yemek.com/mnresize/1250/833/uploads/2014/06/mercimek-corbasi-yemekcom.jpg',
    ingredients: [
      '1 su bardağı kırmızı mercimek',
      '1 adet soğan',
      '1 yemek kaşığı un',
      '1 adet havuç',
      'Tuz, Karabiber'
    ],
    steps: 'Soğanları kavurun. Havuçları ekleyin. Mercimeği ve suyu ekleyip kaynatın. Blendırdan geçirin.',
    duration: 30,
  ),
  const Recipe(
    id: 'r2',
    title: 'Hamburger',
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=600&auto=format&fit=crop',
    ingredients: [
      '200gr Kıyma',
      'Hamburger Ekmeği',
      'Marul',
      'Domates',
      'Turşu'
    ],
    steps: 'Kıymayı yoğurun ve pişirin. Ekmeği ısıtın. Malzemeleri dizin ve servis yapın.',
    duration: 25,
  ),
  const Recipe(
    id: 'r3',
    title: 'Pizza',
    imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=600&auto=format&fit=crop',
    ingredients: [
      'Pizza Hamuru',
      'Mozzarella Peyniri',
      'Sucuk',
      'Mantar',
      'Domates Sosu'
    ],
    steps: 'Hamuru açın. Sosu sürün. Malzemeleri ekleyip 200 derecede pişirin.',
    duration: 40,
  ),
  const Recipe(
    id: 'r4',
    title: 'Makarna',
    imageUrl: 'https://images.unsplash.com/photo-1551183053-bf91a1d81141?q=80&w=600&auto=format&fit=crop',
    ingredients: [
      '1 paket makarna',
      'Salça',
      'Tereyağı',
      'Tuz'
    ],
    steps: 'Suyu kaynatın. Makarnaları haşlayın. Sosu hazırlayıp karıştırın.',
    duration: 15,
  ),
  const Recipe(
    id: 'r5',
    title: 'Izgara Tavuk',
    imageUrl: 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?q=80&w=600&auto=format&fit=crop',
    ingredients: [
      'Tavuk Göğsü',
      'Zeytinyağı',
      'Kekik',
      'Limon'
    ],
    steps: 'Tavukları marine edin. Izgarada arkalı önlü pişirin.',
    duration: 20,
  ),
  const Recipe(
    id: 'r6',
    title: 'Cheesecake',
    imageUrl: 'https://images.unsplash.com/photo-1524351199678-941a58a3df50?q=80&w=600&auto=format&fit=crop',
    ingredients: [
      'Labne Peyniri',
      'Krema',
      'Bisküvi',
      'Şeker',
      'Yumurta'
    ],
    steps: 'Tabanı hazırlayın. Kremayı çırpıp dökün. Fırında düşük ısıda pişirin.',
    duration: 60,
  ),
];

