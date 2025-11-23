import 'package:flutter/material.dart';

class ChartsSection extends StatelessWidget {
  const ChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          // Mobile layout
          return Column(
            children: [
              _buildChartCard('Consommation de matériaux', true),
              const SizedBox(height: 20),
              _buildChartCard('Prévision de demande', false),
            ],
          );
        } else {
          // Desktop layout
          return Row(
            children: [
              Expanded(child: _buildChartCard('Consommation de matériaux', true)),
              const SizedBox(width: 25),
              Expanded(child: _buildChartCard('Prévision de demande', false)),
            ],
          );
        }
      },
    );
  }

  Widget _buildChartCard(String title, bool isConsumption) {
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
              Text(
                title,
                style: const TextStyle(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(isConsumption ? 'Semaine' : '7j'),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(isConsumption ? 'Mois' : '30j'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFf8f9fa), Color(0xFFe9ecef)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isConsumption ? Icons.bar_chart : Icons.show_chart,
                  color: const Color(0xFF4361ee),
                  size: 40,
                ),
                const SizedBox(height: 15),
                Text(
                  isConsumption 
                      ? 'Graphique de consommation' 
                      : 'Courbe de prévision',
                  style: const TextStyle(
                    color: Color(0xFF6c757d),
                    fontWeight: FontWeight.w600,
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