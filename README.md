# Salla7ly 🔧

A Flutter mobile application built to provide users with convenient home maintenance and service solutions.

Salla7ly is a fully working Flutter application with a structured architecture, reusable components, authentication flow, networking infrastructure, local storage, and a scalable feature-first project structure.

---

## ✨ Overview

**Salla7ly** is a home services application developed with Flutter and designed with a scalable and maintainable codebase.

The application provides a structured foundation for connecting users with home maintenance and service solutions while maintaining a clean and organized user experience.

The project demonstrates practical Flutter development using modern tools and development practices, including state management, dependency injection, API communication, local storage, and reusable UI components.

---

## 🚀 Features

- 🔐 User authentication
- 👤 Login and user account flow
- 🏠 Home services experience
- 🧭 Centralized application navigation
- 📱 Responsive UI across different screen sizes
- 🎨 Consistent application theming
- 🧩 Reusable custom widgets
- 🌐 API communication
- 💾 Local data storage
- 🔒 Secure local storage
- 💉 Dependency injection
- 📡 Network request logging
- 🖼️ SVG asset support
- ✨ Smooth and responsive user interface
- 💠 Native splash screen

---

## 🛠️ Tech Stack

### Framework & Language

- **Flutter**
- **Dart**

### State Management & Architecture

- **Flutter BLoC** — state management
- **GetIt** — dependency injection
- **Injectable** — dependency injection code generation
- **Feature-first architecture**

### Networking

- **Dio** — HTTP client
- **Retrofit** — API client generation
- **Pretty Dio Logger** — network request logging
- **JSON Annotation** — JSON serialization
- **Freezed** — immutable models and code generation

### Local Storage

- **Hive** — local database/storage
- **Shared Preferences** — lightweight local storage
- **Flutter Secure Storage** — secure local data storage

### UI & Design

- **Flutter ScreenUtil** — responsive UI
- **Device Preview** — device testing and preview
- **Flutter SVG** — SVG rendering
- **Google Fonts** — custom typography
- **Shimmer** — loading states
- **Auto Size Text** — responsive text
- **Fluttertoast** — user notifications
- **Flutter Native Splash** — native splash screen

---

## 🏗️ Architecture & Project Structure

The project follows a **feature-first architecture**, separating shared application infrastructure from individual application features.

```text
lib/
├── core/
│   ├── helpers/
│   │   ├── validators
│   │   ├── spacing
│   │   ├── toast utilities
│   │   └── shared preferences
│   │
│   ├── routing/
│   │   ├── routes
│   │   └── AppRouter
│   │
│   ├── theming/
│   │   ├── colors
│   │   ├── styles
│   │   └── generated assets
│   │
│   └── widgets/
│       ├── custom buttons
│       ├── custom text fields
│       └── dialog utilities
│
└── feature_user/
    └── auth/
        └── login/
            └── Login Feature
