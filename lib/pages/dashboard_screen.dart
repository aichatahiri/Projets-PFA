import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/nav_tabs_widget.dart';
import '../widgets/dashboard_content.dart';
import '../widgets/sidebar_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  // SUPPRIMÉ : 'settings' de la liste
  final List<String> _sections = [
    'dashboard',
    'planning',
    'fleet',
    'analytics'
  ];

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f7fa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header
              const HeaderWidget(userName: '', userRole: '',),
              
              const SizedBox(height: 20),
              
              // Navigation Tabs
              NavTabsWidget(
                currentIndex: _currentIndex,
                onTabChanged: _onTabChanged, tabs: [],
              ),
              
              const SizedBox(height: 20),
              
              // Main Content
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 992) {
                      // Mobile layout
                      return Column(
                        children: [
                          Expanded(
                            child: DashboardContent(
                              currentSection: _sections[_currentIndex],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            height: 400,
                            child: SidebarWidget(),
                          ),
                        ],
                      );
                    } else {
                      // Desktop layout
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: DashboardContent(
                              currentSection: _sections[_currentIndex],
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            flex: 1,
                            child: SidebarWidget(),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}