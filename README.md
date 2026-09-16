# Salla7ly

An early-stage Flutter project for Salla7ly, currently focused on building the app's foundation: routing, theming, reusable widget layer, and the authentication flow.

> Status: Early stage. The architecture and core modules are in place; feature screens are being built incrementally. The login screen is currently a placeholder.

## What's Included

- App shell via `MaterialApp` configured with `ScreenUtil` (responsive sizing) and `DevicePreview`
- Centralized routing with `AppRouter` using `onGenerateRoute`
- Theming: colors, text styles, and generated asset constants
- Core helpers: input validators, spacing, toast notifications, shared preferences wrapper
- Reusable widgets: custom elevated button, custom text field, dialog utils
- Native splash screen configuration
- Login screen (initial auth feature, placeholder)

## Tech Stack

- Flutter / Dart
- `flutter_bloc` — state management
- `get_it` + `injectable` — dependency injection
- `dio` + `retrofit` + `json_annotation` / `freezed` — networking layer
- `hive`, `shared_preferences`, `flutter_secure_storage` — local storage
- `flutter_screenutil` — responsive UI
- `device_preview` — device preview during development
- `shimmer`, `auto_size_text`, `flutter_svg`, `google_fonts` — UI utilities
- `flutter_native_splash` — splash screen

## Project Structure

```
lib/
├── core/
│   ├── helpers/       # validators, spacing, toasts, shared prefs
│   ├── routing/       # routes + AppRouter
│   ├── theming/       # colors, styles, asset constants
│   └── widgets/       # reusable UI widgets
└── feature_user/
    └── auth/
        └── login/     # login feature (UI, logic, data)
```

## Getting Started

```bash
git clone https://github.com/abdelrhamanadel4-Flutter/salla7ly_01.git
cd salla7ly_01
flutter pub get
flutter run
```