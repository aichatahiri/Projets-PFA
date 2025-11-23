import 'package:flutter/material.dart';

class KpiGrid extends StatelessWidget {
  const KpiGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        _buildKpiCard(
          'Coût total',
          Icons.attach_money,
          '124 500 MAD',
          '5.2% vs mois dernier',
          true,
          [const Color(0xFF4361ee), const Color(0xFF3a56d4)],
        ),
        _buildKpiCard(
          'Distance parcourue',
          Icons.route,
          '3 680 km',
          '12.7% optimisation',
          false,
          [const Color(0xFF7209b7), const Color(0xFF5a08a5)],
        ),
        _buildKpiCard(
          'Émissions CO₂',
          Icons.eco,
          '7.2 t',
          '8.3% réduction',
          true,
          [const Color(0xFF4cc9f0), const Color(0xFF3ab0d4)],
        ),
        _buildKpiCard(
          'Taux de retard',
          Icons.schedule,
          '6.2%',
          '+1.4% attention',
          false,
          [const Color(0xFFf72585), const Color(0xFFd41c6f)],
        ),
      ],
    );
  }

  Widget _buildKpiCard(
    String title,
    IconData icon,
    String value,
    String trend,
    bool isDown,
    List<Color> colors,
  ) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6c757d),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                isDown ? Icons.arrow_downward : Icons.arrow_upward,
                color: isDown ? const Color(0xFF10b981) : const Color(0xFFf72585),
                size: 12,
              ),
              const SizedBox(width: 5),
              Text(
                trend,
                style: TextStyle(
                  fontSize: 12,
                  color: isDown ? const Color(0xFF10b981) : const Color(0xFFf72585),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}