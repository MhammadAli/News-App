# News Application

A feature-rich news application built with Flutter. This app allows users to browse news in categories such as Science, Sports, and Business or search for specific topics of interest. Designed with clean architecture and state management using the BLoC pattern, it provides a seamless and intuitive user experience.

---

## Features

- **Category Navigation**: Quickly access Science, Sports, and Business news using a bottom navigation bar.
- **Search Functionality**: Search for news articles by keywords or topics.
- **Responsive Design**: Optimized for various screen sizes and orientations.
- **Persistent Data**: Save user preferences using Shared Preferences.
- **Web View Support**: Open news articles directly in an embedded WebView.
- **Dark and Light Mode**: Switch between dark and light themes for a personalized viewing experience.

---

## Packages Used

The following packages were utilized to enhance functionality:

| Package                        | Version  |
|--------------------------------|----------|
| `cupertino_icons`              | ^1.0.6   |
| `font_awesome_flutter`         | ^10.7.0  |
| `bloc`                         | ^8.1.4   |
| `flutter_bloc`                 | ^8.1.5   |
| `conditional_builder_null_safety` | ^0.0.6 |
| `dio`                          | ^4.0.6   |
| `hexcolor`                     | ^3.0.1   |
| `shared_preferences`           | ^2.2.3   |
| `webview_flutter`              | ^2.0.3   |

---

## Architecture

This application is built using the **BLoC (Business Logic Component)** pattern for efficient state management and separation of concerns.

- **Data Layer**: Handles API calls using the `dio` package.
- **Presentation Layer**: Displays UI components with dynamic content using Flutter widgets.
- **State Management**: Manages state transitions using `bloc` and `flutter_bloc` packages.
