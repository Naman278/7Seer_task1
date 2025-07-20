import '../models/event.dart';
import '../models/category.dart';
import '../models/artist.dart';

class MockData {
  static List<Event> getFeaturedEvents() {
    return [
      Event(
        id: '1',
        title: 'Nelangsa Randung in Delhi 2025',
        location: 'Delhi, India',
        venue: 'JLN Stadium',
        date: DateTime(2025, 4, 30),
        price: 'Starts from ₹1,299',
        imageUrl: 'assets/landscape_banners/Banner1_landscape.png',
        category: 'Music',
        description:
            'Experience the ultimate music festival with top artists from around the world.',
      ),
      Event(
        id: '2',
        title: 'Comedy Night Special',
        location: 'Mumbai, India',
        venue: 'NCPA Auditorium',
        date: DateTime(2025, 5, 15),
        price: 'Starts from ₹899',
        imageUrl: 'assets/landscape_banners/Banner2_landscape.png',
        category: 'Comedy',
        description: 'A night filled with laughter and entertainment.',
      ),
      Event(
        id: '3',
        title: 'Tech Conference 2025',
        location: 'Bangalore, India',
        venue: 'Palace Grounds',
        date: DateTime(2025, 6, 10),
        price: 'Starts from ₹2,499',
        imageUrl: 'assets/landscape_banners/Banner3_landscape.png',
        category: 'Technology',
        description: 'The biggest tech conference in India.',
      ),
    ];
  }

  static List<Event> getUpcomingEvents() {
    return [
      Event(
        id: '4',
        title: 'Kevin Hart: Acting My Age | India',
        location: 'Indira Gandhi Arena, Delhi',
        venue: 'Indira Gandhi Arena',
        date: DateTime(2025, 4, 30),
        price: '699',
        imageUrl: 'assets/potrait_banners/Banner1_potrait.png',
        bannerImage: 'assets/landscape_banners/Banner1_landscape.png',
        isFavorite: true,
        category: 'Comedy',
        description:
            'Kevin Hart brings his hilarious stand-up comedy to India.',
      ),
      Event(
        id: '5',
        title: 'Kevin H | India',
        location: 'Indira Gan',
        venue: 'DY Patil Stadium',
        date: DateTime(2025, 5, 20),
        price: '3,999',
        imageUrl: 'assets/potrait_banners/Banner2_potrait.png',
        bannerImage: 'assets/landscape_banners/Banner2_landscape.png',
        category: 'Music',
        description: 'Experience Ed Sheeran live in concert.',
      ),
      Event(
        id: '6',
        title: 'Bollywood Night',
        location: 'Pune, India',
        venue: 'Shree Shiv Chhatrapati Sports Complex',
        date: DateTime(2025, 6, 5),
        price: '1,599',
        imageUrl: 'assets/potrait_banners/Banner3_potrait.png',
        bannerImage: 'assets/landscape_banners/Banner3_landscape.png',
        category: 'Music',
        description: 'A night of Bollywood music and dance.',
      ),
    ];
  }

  static List<Event> getPopularEvents() {
    return [
      Event(
        id: '7',
        title: 'Kevin Hart: Acting My Age | India',
        location: 'Delhi, India',
        venue: 'Indira Gandhi Arena',
        date: DateTime(2025, 4, 30),
        price: 'Starts from ₹699',
        imageUrl: 'assets/potrait_banners/Banner1_potrait.png',
        category: 'Comedy',
        description:
            'Kevin Hart brings his hilarious stand-up comedy to India.',
      ),
      Event(
        id: '8',
        title: 'Rock Concert 2025',
        location: 'Chennai, India',
        venue: 'Jawaharlal Nehru Stadium',
        date: DateTime(2025, 5, 25),
        price: 'Starts from ₹1,899',
        imageUrl: 'assets/potrait_banners/Banner2_potrait.png',
        category: 'Music',
        description: 'The biggest rock concert of the year.',
      ),
      Event(
        id: '9',
        title: 'Dance Festival',
        location: 'Hyderabad, India',
        venue: 'Gachibowli Stadium',
        date: DateTime(2025, 6, 15),
        price: 'Starts from ₹999',
        imageUrl: 'assets/potrait_banners/Banner3_potrait.png',
        category: 'Dance',
        description: 'A celebration of dance and culture.',
      ),
    ];
  }

  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'Music',
        icon: 'assets/icons/micro.png',
        color: '#AFFF00',
      ),
      Category(
        id: '2',
        name: 'Music',
        icon: 'assets/icons/micro.png',
        color: '#AFFF00',
      ),
      Category(
        id: '3',
        name: 'Music',
        icon: 'assets/icons/micro.png',
        color: '#AFFF00',
      ),
      Category(
        id: '4',
        name: 'Music',
        icon: 'assets/icons/micro.png',
        color: '#AFFF00',
      ),
      Category(
        id: '5',
        name: 'Music',
        icon: 'assets/icons/micro.png',
        color: '#AFFF00',
      ),
    ];
  }

  static List<Artist> getArtists() {
    return [
      Artist(
        id: '1',
        name: 'Lana Del',
        imageUrl: 'assets/potrait_banners/Banner1_potrait.png',
        genre: 'Pop',
      ),
      Artist(
        id: '2',
        name: 'Ed Sheeran',
        imageUrl: 'assets/potrait_banners/Banner2_potrait.png',
        genre: 'Pop',
      ),
      Artist(
        id: '3',
        name: 'Taylor Swift',
        imageUrl: 'assets/potrait_banners/Banner3_potrait.png',
        genre: 'Pop',
      ),
      Artist(
        id: '4',
        name: 'Drake',
        imageUrl: 'assets/potrait_banners/Banner1_potrait.png',
        genre: 'Hip Hop',
      ),
    ];
  }

  static List<String> getTrendingImages() {
    return [
      'assets/landscape_banners/Banner1_landscape.png',
      'assets/landscape_banners/Banner2_landscape.png',
      'assets/landscape_banners/Banner3_landscape.png',
    ];
  }
}
