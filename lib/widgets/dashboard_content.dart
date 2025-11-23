import 'package:flutter/material.dart';
import '../components/kpi_grid.dart';
import '../components/charts_section.dart';
import '../components/missions_table.dart';
import '../components/planning_section.dart';
import '../components/fleet_section.dart';
import '../components/analytics_section.dart';

class DashboardContent extends StatelessWidget {
  final String currentSection;

  const DashboardContent({super.key, required this.currentSection});

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (currentSection) {
      case 'dashboard':
        content = const DashboardSection();
        break;
      case 'planning':
        content = const PlanningSection();
        break;
      case 'fleet':
        content = const FleetSection();
        break;
      case 'analytics':
        content = const AnalyticsSection();
        break;
      default:
        content = const DashboardSection();
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: content,
    );
  }
}

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // KPI Grid
          const KpiGrid(),

          const SizedBox(height: 30),

          // Charts
          const ChartsSection(),

          const SizedBox(height: 30),

          // Missions Table
          const MissionsTable(),
        ],
      ),
    );
  }
}