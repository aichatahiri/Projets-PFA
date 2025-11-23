import 'package:flutter/material.dart';

class KpiGrid extends StatelessWidget {
  const KpiGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: const [
        KpiCard(
          title: 'Progression chantier',
          value: '68%',
          trend: '+12% ce mois',
          isPositive: true,
          color: Color(0xFF4361ee),
          icon: Icons.trending_up,
        ),
        KpiCard(
          title: 'Livraisons aujourd\'hui',
          value: '3/5',
          trend: '2 en retard',
          isPositive: false,
          color: Color(0xFF7209b7),
          icon: Icons.local_shipping,
        ),
        KpiCard(
          title: 'Stock critique',
          value: '2',
          trend: 'Attention nécessaire',
          isPositive: false,
          color: Color(0xFFf72585),
          icon: Icons.warning,
        ),
        KpiCard(
          title: 'Productivité équipe',
          value: '92%',
          trend: '+5% vs hier',
          isPositive: true,
          color: Color(0xFF4cc9f0),
          icon: Icons.people,
        ),
      ],
    );
  }
}

class KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final bool isPositive;
  final Color color;
  final IconData icon;

  const KpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.trend,
    required this.isPositive,
    required this.color,
    required this.icon,
  });

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
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6c757d),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Value
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Trend
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isPositive ? const Color(0xFF10b981) : const Color(0xFFf72585),
                  size: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  trend,
                  style: TextStyle(
                    fontSize: 10,
                    color: isPositive ? const Color(0xFF10b981) : const Color(0xFFf72585),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}