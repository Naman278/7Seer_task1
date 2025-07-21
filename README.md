# Task 1

![App Demo](media/demo.gif)

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
   git clone https://github.com/Naman278/7Seer_task1.git
   cd 7Seer_task1
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


### Challenges Faced
1. **Responsive Design**: Implementing a responsive layout that works well across different screen sizes while maintaining the dark theme aesthetics
2. **Smooth Animations**: Balancing performance with smooth animations and transitions
3. **Asset Management**: Organizing and optimizing various image assets (banners, icons) for different orientations

### Improvements Made
1. **Modular Architecture & Code Organization**: The app is structured into clear folders for widgets, models, utilities, and constants. Each part of the app is separated into its own module, making the code easy to find, reuse, and update. This organization helps keep the project maintainable and scalable.
2. **Performance Optimization**: All images and icons are stored locally in the app, so they load instantly without needing the internet. The app only loads images when they are needed on the screen, which saves memory and makes the app run faster. This helps the app work smoothly even on devices with less RAM.
3. **Responsive Design**: The app’s layout and font sizes automatically adjust to different screen sizes. The UI is optimized for a wide range of mobile devices, and the app is locked to portrait orientation only for a consistent user experience.

### Known Limitations
1. **Limited Functionality**:  Different buttons, like "See all", "Book Now", are just simulated with pop-up messages. More screeens need to be added for a better layout and workflow.
2. **No State Management**: The app uses basic state updates, which is fine for small apps but not for bigger ones. For larger projects, using tools like Provider or Bloc would make managing data and updates easier and more reliable.
3. **Limited Error Handling**: The app only shows simple error messages for user actions. It doesn’t handle all possible problems, like missing data or unexpected errors. Better error handling would make the app more stable and user-friendly.
1. **No Advanced Asset Optimization**: The app does not use advanced techniques like image caching, lazy loading for very large lists, or asset compression beyond what’s already in the repo. For very large datasets or more demanding use cases, these optimizations would be needed to ensure smooth performance.



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

---

## Animations Used

- **Fade and Scale Transitions**: Event cards and banners use fade and scale transitions when appearing, providing a polished look.
- **Carousel/Slider Animations**: The featured events and trending sections use animated carousels with smooth page transitions and indicator animations.
- **Icon and Navigation Effects**: The bottom navigation bar uses highlight and shadow animations to indicate the active tab.


