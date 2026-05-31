import 'package:flutter/material.dart';

import 'screens/shell/main_navigation_screen.dart';
import 'theme/app_theme.dart';

class PulseBriefApp extends StatelessWidget {
  const PulseBriefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseBrief',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationScreen(),
    );
  }
}
