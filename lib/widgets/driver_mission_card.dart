import 'package:flutter/material.dart';

class DriverMissionCard extends StatelessWidget {
  final Map<String, dynamic> mission;
  final VoidCallback onConfirmDelivery;
  final VoidCallback onStartNavigation;

  const DriverMissionCard({
    super.key,
    required this.mission,
    required this.onConfirmDelivery,
    required this.onStartNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header avec statut
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: mission['isPriority'] == true 
                      ? const Color(0xFFf72585) 
                      : mission['isCurrent'] == true
                          ? const Color(0xFF4cc9f0)
                          : const Color(0xFF4361EE),
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14, color: Color(0xFF6c757d)),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              mission['address'],
                              style: const TextStyle(
                                color: Color(0xFF6c757d),
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(mission['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mission['status'],
                    style: TextStyle(
                      color: _getStatusColor(mission['status']),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Détails
          Container(
            padding: const EdgeInsets.all(12),
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
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: mission['isCurrent'] == true
                      ? ElevatedButton.icon(
                          onPressed: onConfirmDelivery,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4cc9f0),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          icon: const Icon(Icons.check_circle, size: 14),
                          label: const Text('Marquer livré'),
                        )
                      : mission['status'] == 'À faire'
                          ? ElevatedButton.icon(
                              onPressed: onStartNavigation,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4361EE),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 10),
                              ),
                              icon: const Icon(Icons.directions, size: 14),
                              label: const Text('Démarrer'),
                            )
                          : ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF4361EE),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                              ),
                              icon: const Icon(Icons.info, size: 14),
                              label: const Text('Détails'),
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
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF6c757d),
              fontSize: 12,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'En cours':
        return const Color(0xFF4cc9f0);
      case 'À faire':
        return const Color(0xFFf72585);
      case 'Terminé':
        return const Color(0xFF4361EE);
      default:
        return const Color(0xFF6c757d);
    }
  }
}