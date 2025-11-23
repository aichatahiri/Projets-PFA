import 'package:flutter/material.dart';

class PlanningSection extends StatelessWidget {
  const PlanningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCalendarCard(),
          const SizedBox(height: 25),
          _buildMissionsTable(),
        ],
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Container(
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
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Calendrier des missions - Mars 2024',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4361ee),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: const Icon(Icons.chevron_left),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4361ee),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Aujourd\'hui'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4361ee),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    List<String> weekDays = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    
    return Column(
      children: [
        // Headers
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: weekDays.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF4361ee),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  weekDays[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        // Calendar days
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: 28,
          itemBuilder: (context, index) {
            final day = index + 1;
            return _buildCalendarDay(day);
          },
        ),
      ],
    );
  }

  Widget _buildCalendarDay(int day) {
    List<Widget> events = [];
    
    // Ajouter des événements pour certains jours
    if (day == 11) {
      events.addAll([
        _buildMissionEvent('Chantier A', const Color(0xFF4361ee)),
        _buildMissionEvent('Chantier B', const Color(0xFF4361ee)),
      ]);
    }
    if (day == 12) {
      events.add(_buildMissionEvent('Chantier C', const Color(0xFF4361ee)));
    }
    if (day == 14) {
      events.add(_buildMissionEvent('Chantier D', Color(0xFFf72585)));
    }
    if (day == 15) {
      events.add(_buildMissionEvent('Chantier E', const Color(0xFF4361ee)));
    }
    if (day == 18) {
      events.add(_buildMissionEvent('Chantier F', const Color(0xFF4361ee)));
    }
    if (day == 23) {
      events.add(_buildMissionEvent('Chantier H', const Color(0xFF4361ee)));
    }
    if (day == 25) {
      events.add(_buildMissionEvent('Chantier I', const Color(0xFF4361ee)));
    }
    if (day == 27) {
      events.add(_buildMissionEvent('Chantier J', const Color(0xFF4361ee)));
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          ...events,
        ],
      ),
    );
  }

  Widget _buildMissionEvent(String mission, Color color) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        mission,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildMissionsTable() {
    final missions = [
      {'date': '14/03/2024', 'chantier': 'Chantier D - Settat', 'chauffeur': 'Rachid Alami', 'materiaux': 'Gravier 15T', 'status': 'Planifiée'},
      {'date': '15/03/2024', 'chantier': 'Chantier E - Marrakech', 'chauffeur': 'Karim Benali', 'materiaux': 'Ciment 8T', 'status': 'Planifiée'},
      {'date': '18/03/2024', 'chantier': 'Chantier F - Fès', 'chauffeur': 'Mohamed Amine', 'materiaux': 'Sable 12T', 'status': 'Planifiée'},
    ];

    return Container(
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
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Missions planifiées cette semaine',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4361ee),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Planifier une mission'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Chantier')),
                DataColumn(label: Text('Chauffeur')),
                DataColumn(label: Text('Matériaux')),
                DataColumn(label: Text('Statut')),
              ],
              rows: missions.map((mission) {
                return DataRow(cells: [
                  DataCell(Text(mission['date']!)),
                  DataCell(Text(mission['chantier']!)),
                  DataCell(Text(mission['chauffeur']!)),
                  DataCell(Text(mission['materiaux']!)),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4361ee).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        mission['status']!,
                        style: const TextStyle(
                          color: Color(0xFF4361ee),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}