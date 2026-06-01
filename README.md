# Flick TV Flutter Assignment

A Flutter UI/UX and animation assignment developed as part of the Flutter Developer hiring process.

The project focuses on recreating the given reference video/screen with a clean UI, smooth animations, responsive layout, and maintainable Flutter code.

---

## App Details

**App Name:** Yash Gupta  
**Package Name:** `flicktv.yashgupta`

---

## Assignment Objective

Design and develop a Flutter screen similar to the provided reference video.

The implementation focuses on:

- Clean and polished UI
- Smooth animation flow
- Responsive layout for different device sizes
- Well-structured and maintainable code
- Native Flutter animation implementation

---

## Deliverables

The final submission includes:

- GitHub repository link
- Screen recording of the implementation
- Release APK file

---

## Tech Stack

- Flutter
- Dart
- Material Design
- Native Flutter Animations
- BLoC-ready project structure
- Clean and modular folder organization

---

## Third-Party Packages

This assignment follows the instruction:

> Do not use any third-party packages.

No third-party packages are used in the core implementation.

Confetti animation is implemented inside the project structure under the custom animation folder.

---

## Folder Structure

```text
lib/
├── core/
│   ├── animations/
│   │   └── confetti_animation/
│   │       ├── confetti_burst.dart
│   │       └── congetti_particles.dart
│   │
│   ├── utils/
│   │   └── image_assets.dart
│   │
│   └── widget/
│       ├── buttons/
│       │   ├── glass_back_button.dart
│       │   └── primary_button.dart
│       │
│       ├── card/
│       │   └── redirect_info_card.dart
│       │
│       └── info_widgets/
│           └── info_widget.dart
│
├── features/
│   └── home/
│       ├── data/
│       ├── domain/
│       └── presentation/
│           └── home_page/
│               ├── bloc/
│               ├── mixins/
│               │   ├── home_animation_mixin.dart
│               │   └── home_confetti_mixin.dart
│               │
│               ├── model/
│               ├── widget/
│               │   └── animatied_info_card.dart
│               │
│               └── home_page.dart
│
└── main.dart
```

---

## Architecture Overview

The project uses a feature-first structure to keep the codebase clean and scalable.

### `core/`

Contains reusable app-level utilities, widgets, and animations.

Examples:

- Common buttons
- Info cards
- Asset constants
- Confetti animation
- Shared UI components

### `features/home/`

Contains the main assignment screen and related logic.

The `home` feature is divided into:

- `data/` for data-related code
- `domain/` for business/domain layer
- `presentation/` for UI, animation logic, BLoC-ready structure, and widgets

### `mixins/`

Animation-related logic is separated into mixins to keep the main `home_page.dart` file clean and readable.

---

## Key Implementation Highlights

- Custom animated home screen
- Smooth image and text transition flow
- Reusable animated info card widget
- Custom glass-style back button
- Custom primary button
- Confetti animation support
- Clean separation between widgets, animation logic, and screen layout
- Responsive layout handling for different screen sizes

---

## How to Run

Clone the repository and run:

```bash
flutter pub get
flutter run
```

---

## Build APK

To generate a release APK, run:

```bash
flutter build apk --release
```

The generated APK will be available at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

## Tested On

- Android Emulator
- Android Physical Device
- Multiple screen sizes

---

## Developer

**Yash Gupta**  
Flutter Developer

Experienced in Flutter, Dart, Clean Architecture, BLoC, UI/UX implementation, animations, API integration, debugging, and production-level mobile app development.

---

## Notes

- The UI and animations are implemented using Flutter's native capabilities.
- The folder structure is designed to keep the project maintainable.
- The codebase is structured in a way that can be extended easily if more screens or features are added later.
