# Task 1

## Framework Version Used

- **Flutter SDK**: >=3.2.3
- **Dart SDK**: >=3.2.3 <4.0.0
- **Dependencies**:
  - `cupertino_icons: ^1.0.2`
  - `flutter_svg: ^2.0.9`
  - `flutter_lints: ^3.0.0`

> **Note**: This is a completely offline application. All data and assets are bundled within the app and no internet connection is required.

## Setup & Run Instructions

### Prerequisites
- Flutter SDK (>=3.2.3)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Naman278/7Sseer.git
   cd 7Sseer/task1
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build Instructions

- **For Android APK**:
  ```bash
  flutter build apk
  ```

- **For iOS**:
  ```bash
  flutter build ios
  ```

### Pre-built APK

A pre-built APK is available in the repository: `task1-app.apk`

You can download and install this APK directly on Android devices.

## Notes on Challenges, Improvements, or Known Bugs

### Challenges Faced
1. **Responsive Design**: Implementing a responsive layout that works well across different screen sizes while maintaining the dark theme aesthetics
2. **Custom Fonts**: Integrating custom Poppins fonts and ensuring proper font weights across the app
3. **Smooth Animations**: Balancing performance with smooth animations and transitions
4. **Asset Management**: Organizing and optimizing various image assets (banners, icons) for different orientations

### Improvements Made
1. **Modular Architecture**: Separated concerns with clear folder structure and reusable components
2. **Performance Optimization**: Optimized local asset loading for better performance
3. **Accessibility**: Implemented proper contrast ratios and readable typography
4. **Code Organization**: Clean separation of models, widgets, and utilities

### Known Limitations/Bugs
1. **Mock Data**: Currently uses static mock data - needs API integration for production
2. **Limited Functionality**: Booking flow is simulated with snackbar notifications
3. **No State Management**: Uses simple state management - could benefit from Provider/Bloc for larger scale
4. **Limited Error Handling**: Basic error handling for user interactions

### Future Enhancements
- Event detail screens with full booking flow
- User authentication and profile management
- Real API integration with backend services
- Push notifications for event updates
- Advanced filtering and search functionality
- Payment gateway integration
- Social sharing features

## Project Structure

```
lib/
├── constants/
│   ├── app_colors.dart      # Color scheme and gradients
│   └── app_theme.dart       # Theme configuration
├── models/
│   ├── event.dart           # Event data model
│   ├── category.dart        # Category data model
│   └── artist.dart          # Artist data model
├── screens/
│   └── home_screen.dart     # Main home screen
├── utils/
│   └── mock_data.dart       # Sample data for the app
├── widgets/
│   ├── custom_button.dart   # Reusable button component
│   ├── event_card.dart      # Event display card
│   ├── category_card.dart   # Category selection card
│   ├── artist_card.dart     # Artist profile card
│   ├── featured_event_banner.dart  # Featured events carousel
│   ├── trending_section.dart       # Trending images section
│   └── section_header.dart         # Section titles with decorative 
|                                     lines
└── main.dart               # App entry point
```

## Features

- **Dark Theme**: Modern dark UI with lime green accents
- **Responsive Design**: Optimized for standard mobile screen sizes
- **Smooth Animations**: Subtle scale and fade animations on interactions
- **Interactive Elements**: Favorite toggles, category selection, booking buttons
- **Featured Events Carousel**: Horizontal scrolling banner with page indicators
- **Artist Profiles**: Circular artist cards with images
- **Trending Section**: Image carousel with green borders

---

