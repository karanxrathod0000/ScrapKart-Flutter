# ScrapKart-Flutter

Flutter mobile application for smart scrap collection and management with real-time tracking, pickup requests, and Supabase backend integration.

## Project Status

### ✅ Successfully Copied Files (14 core files)

**Configuration:**
- `pubspec.yaml` - All Flutter dependencies

**Core Application:**
- `lib/main.dart` - App entry point
- `lib/core/app_export.dart` - Barrel file for exports
- `lib/routes/app_routes.dart` - Navigation routing

**Presentation Screens:**
- `lib/presentation/splash_screen/splash_screen.dart`
- `lib/presentation/login_screen/login_screen.dart`
- `lib/presentation/home_dashboard/home_dashboard.dart`
- `lib/presentation/create_pickup_request/create_pickup_request.dart`
- `lib/presentation/pickup_history/pickup_history.dart`
- `lib/presentation/real_time_tracking/real_time_tracking.dart`

**Theme & Widgets:**
- `lib/theme/app_theme.dart`
- `lib/widgets/custom_error_widget.dart`
- `lib/widgets/custom_icon_widget.dart`
- `lib/widgets/custom_image_widget.dart`

**Dashboard Widgets:**
- `lib/presentation/home_dashboard/widgets/achievement_banner_widget.dart`

### 📋 Remaining Files to Copy from Rocket.new

**Home Dashboard Widgets:** (5 files)
- educational_carousel_widget.dart
- greeting_header_widget.dart  
- quick_stats_widget.dart
- recent_activity_widget.dart
- schedule_pickup_card_widget.dart

**Configuration Files:**
- env.json
- pubspec.lock
- .gitignore

**Platform Folders:** (Optional for web deployment)
- android/
- ios/
- web/
- assets/

## Quick Setup

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK
- Android Studio / VS Code
- Firebase account
- Supabase account

### Installation

```bash
# Clone repository
git clone https://github.com/karanxrathod0000/ScrapKart-Flutter.git
cd ScrapKart-Flutter

# Install dependencies  
flutter pub get

# Run on emulator/device
flutter run

# Build for web
flutter build web
```

## Deployment

### ❗ Important: Flutter Web Deployment

This is a Flutter mobile app. To deploy on Vercel:

1. **Build Flutter Web Version:**
```bash
flutter build web --release
```

2. **Deploy to Vercel:**
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy build/web folder
cd build/web
vercel --prod
```

3. **Alternative: Firebase Hosting** (Recommended for Flutter)
```bash
firebase init hosting
firebase deploy
```

### Configuration

1. **Google Maps API:**
   - Get API key from Google Cloud Console
   - Enable Maps SDK for Android, iOS, and JavaScript
   - Add key to platform-specific files

2. **Firebase Setup:**
   - Create Firebase project
   - Add Android/iOS/Web apps
   - Download config files
   - Enable Authentication, Firestore, Storage

3. **Supabase Integration:**
   - Create Supabase project
   - Get project URL and anon key
   - Add to env.json

## Features

- ✅ Splash Screen with branding
- ✅ Authentication (Email/Password, OTP, Google Sign-In)
- ✅ Home Dashboard with stats and activities
- ✅ Create Pickup Requests with map integration
- ✅ Real-time Tracking with Google Maps
- ✅ Pickup History with filters
- ✅ Custom widgets and theming
- 🔄 ML-based scrap classification (pending integration)
- 🔄 Price prediction (pending integration)

## Architecture

```
lib/
├── core/           # Core utilities and exports
├── presentation/   # UI screens and widgets  
│   ├── splash_screen/
│   ├── login_screen/
│   ├── home_dashboard/
│   │   └── widgets/
│   ├── create_pickup_request/
│   ├── pickup_history/
│   └── real_time_tracking/
├── routes/         # Navigation
├── theme/          # App theming
├── widgets/        # Shared widgets
└── main.dart       # Entry point
```

## Test Credentials

- **User**: user@scrapkart.com / user123
- **Driver**: driver@scrapkart.com / driver123  
- **Admin**: admin@scrapkart.com / admin123

## Next Steps

1. Copy remaining widget files from Rocket.new
2. Add environment configuration
3. Set up Firebase project
4. Configure Google Maps API
5. Build for web: `flutter build web`
6. Deploy to Firebase Hosting or Vercel
7. Test all features
8. Set up CI/CD with GitHub Actions

## Tech Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **Backend**: Firebase / Supabase
- **Maps**: Google Maps Flutter
- **State Management**: Provider / StatefulWidget
- **Database**: Firestore / Supabase PostgreSQL
- **Auth**: Firebase Auth / Supabase Auth

## License

MIT License - Feel free to use for learning and projects

## Contact

For issues or questions, please open a GitHub issue.

---
**Note**: This project was scaffolded using Rocket.new and is being migrated to GitHub for version control and deployment.
