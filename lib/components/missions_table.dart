import 'package:flutter/material.dart';

class MissionsTable extends StatelessWidget {
  const MissionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> missions = [
      {
        'chantier': 'Chantier A - Casa',
        'chauffeur': 'Karim Benali',
        'materiaux': 'Ciment 12T',
        'eta': '10:20',
        'status': 'En cours',
        'priority': 'Élevée',
        'statusColor': const Color(0xFF4cc9f0),
        'priorityColor': const Color(0xFFf72585),
      },
      {
        'chantier': 'Chantier B - Technopark',
        'chauffeur': 'Mohamed Amine',
        'materiaux': 'Sable 20T',
        'eta': '13:40',
        'status': 'Planifiée',
        'priority': 'Moyenne',
        'statusColor': const Color(0xFF4361ee),
        'priorityColor': const Color(0xFFf59e0b),
      },
      {
        'chantier': 'Chantier C - Rabat',
        'chauffeur': 'Hassan Idrissi',
        'materiaux': 'Acier 5T',
        'eta': '09:15',
        'status': 'Livrée',
        'priority': 'Basse',
        'statusColor': const Color(0xFF10b981),
        'priorityColor': const Color(0xFF10b981),
      },
      {
        'chantier': 'Chantier D - Settat',
        'chauffeur': 'Rachid Alami',
        'materiaux': 'Gravier 15T',
        'eta': '16:30',
        'status': 'Retard',
        'priority': 'Élevée',
        'statusColor': const Color(0xFFf72585),
        'priorityColor': const Color(0xFFf72585),
      },
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
                'Missions en cours',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4361ee),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    icon: const Icon(Icons.filter_alt, size: 16),
                    label: const Text('Filtrer'),
                  ),
                  const SizedBox(width: 10),
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
                    label: const Text('Nouvelle mission'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Chantier')),
                DataColumn(label: Text('Chauffeur')),
                DataColumn(label: Text('Matériaux')),
                DataColumn(label: Text('ETA')),
                DataColumn(label: Text('Statut')),
                DataColumn(label: Text('Priorité')),
              ],
              rows: missions.map((mission) {
                // Conversion sécurisée des types
                final String chantier = mission['chantier'] as String;
                final String chauffeur = mission['chauffeur'] as String;
                final String materiaux = mission['materiaux'] as String;
                final String eta = mission['eta'] as String;
                final String status = mission['status'] as String;
                final String priority = mission['priority'] as String;
                final Color statusColor = mission['statusColor'] as Color;
                final Color priorityColor = mission['priorityColor'] as Color;

                return DataRow(
                  cells: [
                    DataCell(Text(chantier)),
                    DataCell(Text(chauffeur)),
                    DataCell(Text(materiaux)),
                    DataCell(Text(eta)),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        priority,
                        style: TextStyle(
                          color: priorityColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}