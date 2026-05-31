import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  const AppGradients._();

  static const LinearGradient pageBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.polarWhite,
      AppColors.ceramicWhite,
      AppColors.shoreFoam,
    ],
  );

  static const LinearGradient oceanAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.lightAquaBlue,
      AppColors.skyBlue,
      AppColors.tideBlue,
    ],
  );

  static const LinearGradient sandAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.sandBeige,
      AppColors.warmSand,
    ],
  );
}
