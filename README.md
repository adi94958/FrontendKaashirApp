# Project Overview

This README provides a detailed explanation of the folder structure used in this Flutter project. The structure is designed to keep the codebase organized, maintainable, and scalable, especially when working on complex applications or in a collaborative environment.

## Folder Structure

### 1. `lib/`

This is the main directory containing all Dart code for the application.

- **`src/`**: Contains all source code files, separated from other types of files.

  - **`models/`**: Stores data models and entity classes used throughout the app.
  - **`services/`**: Contains service classes such as API calls, database interactions, and local storage management.
  - **`screens/`**: Includes all screen (page) widgets.
    - **`home/`**: Houses widgets and logic for the home screen.
    - **`login/`**: Contains widgets and logic for the login screen.
  - **`widgets/`**: Reusable UI components are placed here.
  - **`utils/`**: Utility functions, constants, and helpers are stored here.
  - **`providers/`**: Holds state management files, typically used with Provider or similar libraries.
  - **`routes/`**: Manages application routes and navigation logic.

- **`main.dart`**: The entry point of the application, initializing the app and setting up the root widget.

### 2. `assets/`

This directory contains all static assets such as images, fonts, and JSON files.

- **`images/`**: Stores image files used in the app.
- **`fonts/`**: Contains custom fonts.
- **`json/`**: Holds JSON files if any are required by the app.

### 3. `test/`

All unit and widget test files are located here to ensure the application is robust and functioning as expected.

## Example Folder Structure

```
project-root/
├── lib/
│   ├── src/
│   │   ├── models/
│   │   │   └── user_model.dart
│   │   ├── services/
│   │   │   └── api_service.dart
│   │   ├── screens/
│   │   │   ├── home/
│   │   │   │   └── home_screen.dart
│   │   │   └── login/
│   │   │       └── login_screen.dart
│   │   ├── widgets/
│   │   │   └── custom_button.dart
│   │   ├── utils/
│   │   │   └── constants.dart
│   │   ├── providers/
│   │   │   └── auth_provider.dart
│   │   └── routes/
│   │       └── app_routes.dart
│   └── main.dart
├── assets/
│   ├── images/
│   │   └── logo.png
│   ├── fonts/
│   │   └── Roboto-Regular.ttf
│   └── json/
│       └── data.json
├── test/
│   └── widget_test.dart
└── pubspec.yaml
```

## Folder Purpose Summary

- **`lib/src/models/`**: Data structures and models.
- **`lib/src/services/`**: API and service layers.
- **`lib/src/screens/`**: UI screens categorized by feature or section.
- **`lib/src/widgets/`**: Small reusable widgets.
- **`lib/src/utils/`**: Helper functions and constants.
- **`lib/src/providers/`**: State management and business logic.
- **`lib/src/routes/`**: Navigation and routing logic.
- **`assets/`**: Static resources like images, fonts, and JSON.
- **`test/`**: Unit and widget tests.

This structure promotes better organization, making the codebase easier to navigate and maintain. Each folder serves a specific purpose, ensuring that related files are grouped logically.
