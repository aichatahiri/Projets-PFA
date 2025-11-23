import 'package:flutter/material.dart';

class AlertsPanel extends StatelessWidget {
  const AlertsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Alertes chantier',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFf72585),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AlertItem(
              icon: Icons.local_shipping,
              title: 'Livraison en retard',
              message: 'Gravier 15T - Retard 45min',
            ),
            const AlertItem(
              icon: Icons.inventory,
              title: 'Stock critique',
              message: 'Ciment: 2T restants',
            ),
            const AlertItem(
              icon: Icons.people,
              title: 'Équipe sous-effectif',
              message: '2 ouvriers absents aujourd\'hui',
            ),
          ],
        ),
      ),
    );
  }
}

class AlertItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const AlertItem({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf72585).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(
            color: Color(0xFFf72585),
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFf72585),
            size: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
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