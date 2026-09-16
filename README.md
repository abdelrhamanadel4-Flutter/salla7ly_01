# Salla7ly 🔧

An early-stage Flutter project for **Salla7ly**. The repository currently provides the application's foundation: routing, theming, a reusable widget layer, and the beginning of the authentication flow.

> This is the initial foundation of the project. Feature screens are being built incrementally on top of the core modules.

## ✨ Overview

Salla7ly is being built as a Flutter application. The current codebase establishes the app shell, centralized routing, theme and asset management, core helpers, reusable widgets, and native splash configuration — with the login screen as the first feature being built out.

## 🚀 Features

Current status — foundation and first feature:

- 📱 App shell with `ScreenUtil` responsive sizing and `DevicePreview`
- 🧭 Centralized routing via `AppRouter` (named-route generation)
- 🎨 Theming: app colors, text styles, and generated asset constants
- 🛠️ Core helpers: input validators, spacing, toast notifications, shared preferences wrapper
- 🧩 Reusable widgets: custom elevated button, custom text field, dialog utils
- 💠 Native splash screen configuration
- 👤 Login screen (initial auth feature, placeholder)

## 🛠️ Tech Stack

### Framework & Language

- Flutter
- Dart

### State Management & Architecture

- `flutter_bloc` — state management
- `get_it` + `injectable` — dependency injection
- Feature-first layout under `core/` and `feature_user/`

### Networking

- `dio` + `retrofit` + `pretty_dio_logger`
- `json_annotation` + `freezed` — models

### Local Storage & Device Services

- `hive`
- `shared_preferences`
- `flutter_secure_storage`

### UI & Design

- `flutter_screenutil` — responsive UI
- `device_preview` — device preview in development
- `shimmer`, `auto_size_text`, `flutter_svg`, `google_fonts`
- `fluttertoast` — notifications
- `flutter_native_splash` — splash screen

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── helpers/       # validators, spacing, toasts, shared prefs helper
│   ├── routing/       # routes + AppRouter
│   ├── theming/       # colors, styles, generated asset constants
│   └── widgets/       # reusable UI widgets
└── feature_user/
    └── auth/
        └── login/     # login feature (UI present, logic/data planned)
```

## 📱 Application Version

Current project version: **1.0.0+1**

## 📸 Screenshots

Add screenshots here to showcase the app shell and the login screen once the feature UI is complete.

## ▶️ Getting Started

```bash
git clone https://github.com/abdelrhamanadel4-Flutter/salla7ly_01.git
cd salla7ly_01
flutter pub get
flutter run
```

## 📄 Note

This is an early-stage repository. The architecture and core modules are in place; the login screen is currently a placeholder awaiting its data layer.