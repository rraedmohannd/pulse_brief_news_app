# PulseBrief

## Project Overview

PulseBrief is a professional Flutter news digest app built for the News App idea from the requirements. It includes categories, a news list, article details, search, filters, and saved articles using local mock data.

## Why This Idea Was Chosen

News apps are a strong academic project choice because they naturally demonstrate navigation, model-driven lists, data passing, filtering, reusable widgets, and simple state management.

## Features

- Home dashboard with featured breaking news, trending articles, categories, and saved count.
- Explore screen with search by title, summary, category, source, or author.
- Category and reading tag filters.
- News details screen that receives a full `NewsArticleModel` object.
- Saved articles stored in memory with save and remove actions.
- Local SVG icons and illustrations plus network article images.
- Premium Editorial Ocean theme with animated ocean-inspired background.

## Screens

- Home Screen
- Explore News Screen
- News Details Screen
- Saved Articles Screen
- About/Profile Screen

## Folder Structure

```text
lib/
  main.dart
  app.dart
  theme/
  models/
  data/
  controllers/
  screens/
    shell/
    home/
    explore/
    details/
    saved/
    about/
  widgets/
assets/
  icons/
  illustrations/
```

## MVC Explanation

- Models hold article, category, and reading tag data.
- Views are the Flutter screens and reusable widgets that display the UI.
- Controller methods manage searching, filtering, breaking/trending lists, and saved article state.

## OOP Concepts

- Encapsulation: immutable model classes keep article, category, and tag data organized.
- Abstraction: `NewsController` exposes clear methods instead of spreading list logic across screens.
- Composition: article objects combine category names, reading tags, source metadata, and image data.

## Packages Used

- `google_fonts`
- `flutter_svg`
- `url_launcher`
- `intl`

## How to Run

```bash
flutter pub get
flutter run
```

## Screenshots Placeholder

Add screenshots for Home, Explore, Details, Saved Articles, and About after running the app on a device or emulator.

## Future Improvements

- Persist saved articles locally.
- Add user-selected text size preferences.
- Add offline image caching.
- Add more category-specific article collections.
