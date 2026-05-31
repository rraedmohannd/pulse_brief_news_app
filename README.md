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
- Explore News 
- News Details 
- Saved Articles 
- About/Profile 

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

<img width="390" height="848" alt="home" src="https://github.com/user-attachments/assets/340d06eb-3119-43e7-9bfd-05ead1387746" />
<img width="384" height="849" alt="saved" src="https://github.com/user-attachments/assets/13496c14-277f-4ef4-8c78-1df7b516e064" />
<img width="390" height="854" alt="explor" src="https://github.com/user-attachments/assets/7c5ea45c-d8e6-4f4f-ad03-c0015c987565" />
<img width="390" height="854" alt="detalis" src="https://github.com/user-attachments/assets/32728e38-53f5-4bd2-b528-93f6cf30117f" />
<img width="380" height="848" alt="about" src="https://github.com/user-attachments/assets/364065af-e6ea-4530-b3d9-f7b18a1f6b2d" />


## Future Improvements

- Persist saved articles locally.
- Add user-selected text size preferences.
- Add offline image caching.
- Add more category-specific article collections.
