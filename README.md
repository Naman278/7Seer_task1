# Tixoo - Event Booking App

A modern, polished Flutter application for event booking with a dark theme UI inspired by apps like CRED, CoinDCX, and Jupiter.

## 🎨 Features

### Design & UI
- **Dark Theme**: Modern dark UI with lime green accents
- **Responsive Design**: Optimized for standard mobile screen sizes
- **Smooth Animations**: Subtle scale and fade animations on interactions
- **Modern Typography**: Clean, readable fonts with proper hierarchy
- **Consistent Spacing**: Well-defined padding and margins throughout

### Components
- **Featured Events Carousel**: Horizontal scrolling banner with page indicators
- **Category Selection**: Interactive category cards with selection states
- **Event Cards**: Detailed event information with booking functionality
- **Artist Profiles**: Circular artist cards with images
- **Trending Section**: Image carousel with green borders
- **Search & Location**: Location selector and search functionality

### Interactive Elements
- **Animated Buttons**: Scale animations on press
- **Favorite Toggle**: Heart icons with color changes
- **Horizontal Scrolling**: Smooth scrolling lists for events and categories
- **Page Indicators**: Dot indicators for carousels

## 📁 Project Structure

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
│   └── section_header.dart         # Section titles with decorative lines
└── main.dart               # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.2.3)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd task1
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎯 Key Features Implementation

### 1. Modern Dark Theme
- Custom color palette with lime green accents
- Consistent typography using custom Poppins fonts
- Proper contrast ratios for accessibility

### 2. Responsive Layout
- Uses `CustomScrollView` with `SliverAppBar` for smooth scrolling
- Horizontal scrolling lists for events and categories
- Proper spacing and padding for different screen sizes

### 3. Smooth Animations
- Scale animations on button presses
- Fade-in animations for cards
- Smooth page transitions in carousels

### 4. Modular Architecture
- Separated concerns with clear folder structure
- Reusable widget components
- Clean data models

### 5. Interactive Elements
- Favorite toggle functionality
- Category selection with visual feedback
- Booking buttons with snackbar notifications

## 🎨 Design System

### Colors
- **Primary Green**: `#00FF88` - Main accent color
- **Background**: `#0A0A0A` - Dark background
- **Surface**: `#1A1A1A` - Card backgrounds
- **Text Primary**: `#FFFFFF` - Main text
- **Text Secondary**: `#B0B0B0` - Secondary text

### Typography
- **Font Family**: Poppins (Custom Fonts)
- **Headings**: 20-24px, FontWeight.w600
- **Body Text**: 14-16px, FontWeight.w400
- **Labels**: 12-14px, FontWeight.w500

### Spacing
- **Padding**: 16px standard
- **Margins**: 8px, 16px, 24px
- **Border Radius**: 12px for cards, 16px for containers

## 📱 Screenshots

The app includes:
- Location selector with search bar
- Featured events carousel
- Category selection
- Upcoming events with filters
- Artist profiles
- Trending section
- Popular events

## 🔧 Customization

### Adding New Events
Edit `lib/utils/mock_data.dart` to add new events, categories, or artists.

### Changing Colors
Modify `lib/constants/app_colors.dart` to update the color scheme.

### Updating Theme
Edit `lib/constants/app_theme.dart` to change typography, spacing, or other theme properties.

## 📦 Dependencies

- `flutter`: Core Flutter framework
- `cupertino_icons`: iOS-style icons
- `cached_network_image`: Image caching for better performance

## 🎯 Future Enhancements

- Event detail screens
- Booking flow implementation
- User authentication
- Real API integration
- Push notifications
- Offline support

## 📄 License

This project is created for demonstration purposes.

---

**Built with ❤️ using Flutter**
