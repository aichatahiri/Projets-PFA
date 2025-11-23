import 'package:flutter/material.dart';

class DriverMissionCard extends StatelessWidget {
  final Map<String, dynamic> mission;

  const DriverMissionCard({super.key, required this.mission});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header avec statut
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: mission['isPriority'] == true 
                      ? Colors.red 
                      : Colors.blue,
                  width: 4,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mission['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            mission['address'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(mission['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    mission['status'],
                    style: TextStyle(
                      color: _getStatusColor(mission['status']),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Détails
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildDetailRow('Quantité', mission['quantity']),
                _buildDetailRow('ETA', mission['eta']),
                _buildDetailRow('Horaire', mission['timeWindow']),
                _buildDetailRow('Priorité', mission['priority']),
              ],
            ),
          ),
          // Actions
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mission['isCurrent'] == true
                          ? Colors.green
                          : Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: Icon(mission['isCurrent'] == true
                        ? Icons.check_circle
                        : Icons.directions),
                    label: Text(mission['isCurrent'] == true
                        ? 'Marquer livré'
                        : 'Démarrer'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'En cours':
        return Colors.blue;
      case 'À faire':
        return Colors.orange;
      case 'Terminé':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}