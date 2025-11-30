import 'package:flutter/material.dart';

class ChartsSection extends StatelessWidget {
  const ChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildChartCard('Consommation de matériaux')),
        const SizedBox(width: 16),
        Expanded(child: _buildChartCard('Prévision de demande')),
      ],
    );
  }

  Widget _buildChartCard(String title) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212529),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFf8f9fa),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Graphique: $title',
                  style: const TextStyle(
                    color: Color(0xFF6c757d),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}