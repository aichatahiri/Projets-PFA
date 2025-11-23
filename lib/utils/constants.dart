import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4361ee);
  static const Color primaryDark = Color(0xFF3a56d4);
  static const Color secondary = Color(0xFF7209b7);
  static const Color success = Color(0xFF4cc9f0);
  static const Color warning = Color(0xFFf72585);
  static const Color light = Color(0xFFf8f9fa);
  static const Color dark = Color(0xFF212529);
  static const Color gray = Color(0xFF6c757d);
  static const Color grayLight = Color(0xFFe9ecef);
}

class AppStyles {
  static const double borderRadius = 16.0;
  
  // Méthode pour obtenir l'ombre (ne peut pas être const)
  static BoxShadow get shadow => BoxShadow(
    color: const Color(0x14000000),
    blurRadius: 30,
    offset: const Offset(0, 10),
  );
  
  // Alternative : liste de shadows (peut être const)
  static const List<BoxShadow> shadowList = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 30,
      offset: Offset(0, 10),
    ),
  ];
}