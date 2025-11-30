import 'package:btp_optim/widgets/site_manager/driver_navigation_card.dart';
import 'package:btp_optim/widgets/site_manager/driver_stats_card.dart';
import 'package:flutter/material.dart';
import '../widgets/driver_mission_card.dart';


class DriverDashboard extends StatefulWidget {
  const DriverDashboard({super.key, required Map<String, String> userData});

  @override
  State<DriverDashboard> createState() => _DriverDashboardState();
}

class _DriverDashboardState extends State<DriverDashboard> {
  int _progress = 65;

  final List<Map<String, dynamic>> _missions = [
    {
      'id': '1',
      'title': 'Chantier A',
      'address': 'Bd Al Massira, Casablanca',
      'status': 'En cours',
      'quantity': 'Ciment 6 T',
      'eta': '10:20',
      'timeWindow': '08:00 - 12:00',
      'priority': 'Élevée',
      'isPriority': true,
      'isCurrent': true,
    },
    {
      'id': '2',
      'title': 'Chantier B',
      'address': 'Technopark, Casablanca',
      'status': 'À faire',
      'quantity': 'Sable 20 T',
      'eta': '13:40',
      'timeWindow': '10:00 - 16:00',
      'priority': 'Normale',
      'isPriority': false,
      'isCurrent': false,
    },
  ];

  void _confirmDelivery(String missionId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmer la livraison'),
          content: const Text('Êtes-vous sûr de vouloir marquer cette mission comme livrée ?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateMissionStatus(missionId);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Livraison confirmée !')),
                );
              },
              child: const Text('Confirmer'),
            ),
          ],
        );
      },
    );
  }

  void _updateMissionStatus(String missionId) {
    setState(() {
      final mission = _missions.firstWhere((m) => m['id'] == missionId);
      mission['status'] = 'Terminé';
      mission['isCurrent'] = false;
      mission['isPriority'] = false;
      _progress = 85;
    });
  }

  void _startNavigation(String missionId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigation démarrée vers $missionId')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f7fa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Header simplifié pour mobile
              _buildMobileHeader(),
              const SizedBox(height: 16),
              
              // Date Header
              _buildDateHeader(),
              const SizedBox(height: 16),
              
              // Main Content - Layout vertical pour mobile
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Missions Section
                      _buildMissionsSection(),
                      const SizedBox(height: 16),
                      
                      // Stats Card
                      DriverStatsCard(progress: _progress),
                      const SizedBox(height: 16),
                      
                      // Navigation Card
                      const DriverNavigationCard(),
                      const SizedBox(height: 16),
                      
                      // Map Card
                      _buildMapCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4361EE), Color(0xFF7209B7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.local_shipping,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Karim Benali',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212529),
                  ),
                ),
                Text(
                  'Chauffeur - TR-01',
                  style: TextStyle(
                    color: Color(0xFF6c757d),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green),
            ),
            child: const Text(
              'En service',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mes missions du jour',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Jeudi 14 mars 2024',
            style: TextStyle(
              color: Color(0xFF6c757d),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF4361EE),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: const Icon(Icons.calendar_today, size: 14),
                  label: const Text('Calendrier'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      // Refresh data
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4361EE),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: const Icon(Icons.refresh, size: 14),
                  label: const Text('Actualiser'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMissionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            'Missions en cours',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _missions.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DriverMissionCard(
                mission: _missions[index],
                onConfirmDelivery: () => _confirmDelivery(_missions[index]['id']),
                onStartNavigation: () => _startNavigation(_missions[index]['title']),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMapCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Itinéraire optimisé',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFe4edf5), Color(0xFFd4e3f2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  size: 32,
                  color: Color(0xFF4361EE),
                ),
                SizedBox(height: 8),
                Text(
                  'Carte des trajets',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4361EE),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '75% du trajet effectué',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6c757d),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}