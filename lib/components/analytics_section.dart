import 'package:flutter/material.dart';

class AnalyticsSection extends StatelessWidget {
  const AnalyticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 768) {
            // Mobile layout
            return Column(
              children: [
                _buildPerformanceChart(),
                const SizedBox(height: 25),
                _buildMetricsGrid(),
              ],
            );
          } else {
            // Desktop layout
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildPerformanceChart(),
                ),
                const SizedBox(width: 25),
                Expanded(
                  flex: 1,
                  child: _buildMetricsGrid(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildPerformanceChart() {
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
                'Performance globale',
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
                    child: const Text('3 mois'),
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
                    child: const Text('12 mois'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFf8f9fa), Color(0xFFe9ecef)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.area_chart,
                  color: Color(0xFF4361ee),
                  size: 40,
                ),
                SizedBox(height: 15),
                Text(
                  'Analytics détaillées',
                  style: TextStyle(
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

  Widget _buildMetricsGrid() {
    return Column(
      children: [
        _buildMetricCard(
          'Efficacité des trajets',
          Icons.route,
          '87.5%',
          '+5.2% vs trimestre dernier',
          false,
          [const Color(0xFF4361ee), const Color(0xFF3a56d4)],
        ),
        const SizedBox(height: 15),
        _buildMetricCard(
          'Taux de chargement',
          Icons.monitor_weight,
          '92.3%',
          '+3.7% optimisation',
          false,
          [const Color(0xFF7209b7), const Color(0xFF5a08a5)],
        ),
        const SizedBox(height: 15),
        _buildMetricCard(
          'Coût par km',
          Icons.attach_money,
          '2.34 MAD',
          '-8.1% réduction',
          true,
          [const Color(0xFF4cc9f0), const Color(0xFF3ab0d4)],
        ),
      ],
    );
  }

  Widget _buildMetricCard(
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
      padding: const EdgeInsets.all(20),
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
              fontSize: 24,
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