import 'package:flutter/material.dart';

class MissionsTable extends StatelessWidget {
  const MissionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            'Missions en cours',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 16),
          DataTable(
            columns: const [
              DataColumn(label: Text('Chantier')),
              DataColumn(label: Text('Chauffeur')),
              DataColumn(label: Text('Statut')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Chantier A - Casa')),
                DataCell(Text('Karim Benali')),
                DataCell(Text('En cours')),
              ]),
              DataRow(cells: [
                DataCell(Text('Chantier B - Technopark')),
                DataCell(Text('Mohamed Amine')),
                DataCell(Text('Planifiée')),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}