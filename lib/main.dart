import 'package:flutter/material.dart';
import 'pages/dashboard_screen.dart';
import 'pages/driver_dashboard.dart';
import 'pages/site_manager_dashboard.dart'; // NOUVEAU

void main() {
  runApp(const BtpOptimApp());
}

class BtpOptimApp extends StatelessWidget {
  const BtpOptimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTP Optim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
        scaffoldBackgroundColor: const Color(0xFFf5f7fa),
      ),
      // Changer ici selon l'utilisateur connecté
      home: const SiteManagerDashboard(), // Chef de Chantier
      // home: const DriverDashboard(), // Chauffeur
      // home: const DashboardScreen(), // Responsable Logistique
      debugShowCheckedModeBanner: false,
    );
  }
}