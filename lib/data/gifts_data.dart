class GiftItem {
  final String emoji;
  final String name;
  final int price;
  final String category;

  const GiftItem({
    required this.emoji,
    required this.name,
    required this.price,
    required this.category,
  });
}

class GiftsData {
  static const categories = [
    'Popular',
    'Love',
    'Luxury',
    'Special',
    'Lucky 🍀',
  ];

  static const gifts = [
    GiftItem(emoji: '🎁', name: 'Gift Box', price: 10, category: 'Popular'),
    GiftItem(emoji: '🌹', name: 'Rose', price: 20, category: 'Love'),
    GiftItem(emoji: '❤️', name: 'Heart', price: 50, category: 'Love'),
    GiftItem(emoji: '💋', name: 'Kiss', price: 80, category: 'Love'),
    GiftItem(emoji: '💎', name: 'Diamond', price: 500, category: 'Luxury'),
    GiftItem(emoji: '👑', name: 'Crown', price: 1000, category: 'Luxury'),
    GiftItem(emoji: '🚀', name: 'Rocket', price: 500, category: 'Special'),
    GiftItem(emoji: '🦄', name: 'Unicorn', price: 1200, category: 'Special'),
    GiftItem(emoji: '🍀', name: 'Lucky Clover', price: 100, category: 'Lucky 🍀'),
    GiftItem(emoji: '🎯', name: 'Lucky Shot', price: 200, category: 'Lucky 🍀'),
    GiftItem(emoji: '🧧', name: 'Lucky Red', price: 500, category: 'Lucky 🍀'),
    GiftItem(emoji: '🐉', name: 'Lucky Dragon', price: 1000, category: 'Lucky 🍀'),
  ];
}
