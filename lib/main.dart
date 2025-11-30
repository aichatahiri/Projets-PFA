import 'package:flutter/material.dart';
import 'pages/login_screen.dart';

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
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
      
   
      // home: const DashboardScreen(userData: {},),
      // home: const DriverDashboard(userData: {},), 
      // home: const SiteManagerDashboard(userData: {},),
   