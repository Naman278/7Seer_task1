class Event {
  final String id;
  final String title;
  final String location;
  final String venue;
  final DateTime date;
  final String price;
  final String imageUrl;
  final String? bannerImage;
  final bool isFavorite;
  final String category;
  final String description;

  Event({
    required this.id,
    required this.title,
    required this.location,
    required this.venue,
    required this.date,
    required this.price,
    required this.imageUrl,
    this.bannerImage,
    this.isFavorite = false,
    required this.category,
    required this.description,
  });

  Event copyWith({
    String? id,
    String? title,
    String? location,
    String? venue,
    DateTime? date,
    String? price,
    String? imageUrl,
    String? bannerImage,
    bool? isFavorite,
    String? category,
    String? description,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      venue: venue ?? this.venue,
      date: date ?? this.date,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      bannerImage: bannerImage ?? this.bannerImage,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
