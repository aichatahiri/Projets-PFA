import 'package:flutter/material.dart';
import '../widgets/driver_header.dart';
import '../widgets/driver_mission_card.dart';
import '../widgets/driver_sidebar.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  int _currentMissionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f7fa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const DriverHeader(),
              const SizedBox(height: 20),
              _buildDateHeader(),
              const SizedBox(height: 20),
              Expanded(
                child: _buildMissionsList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildDateHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mes missions du jour',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jeudi 14 mars 2024',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionsList() {
    final missions = [
      {
        'title': 'Chantier A',
        'address': 'Bd Al Massira, Casablanca',
        'status': 'En cours',
        'quantity': 'Ciment 6 T',
        'eta': '10:20',
        'timeWindow': '08:00 - 12:00',
        'priority': 'Élevée',
        'isCurrent': true,
        'isPriority': true,
      },
      {
        'title': 'Chantier B',
        'address': 'Technopark, Casablanca',
        'status': 'À faire',
        'quantity': 'Sable 20 T',
        'eta': '13:40',
        'timeWindow': '10:00 - 16:00',
        'priority': 'Normale',
        'isCurrent': false,
        'isPriority': false,
      },
    ];

    return ListView.builder(
      itemCount: missions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DriverMissionCard(mission: missions[index]),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentMissionIndex,
      onTap: (index) {
        setState(() {
          _currentMissionIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Missions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}