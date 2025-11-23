import 'package:flutter/material.dart';

class NavTabsWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;

  const NavTabsWidget({
    super.key,
    required this.currentIndex,
    required this.onTabChanged, required List<dynamic> tabs,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {
        'icon': Icons.dashboard,
        'label': 'Tableau de bord',
        'section': 'dashboard'
      },
      {
        'icon': Icons.map,
        'label': 'Planification',
        'section': 'planning'
      },
      {
        'icon': Icons.local_shipping,
        'label': 'Flotte',
        'section': 'fleet'
      },
      {
        'icon': Icons.analytics,
        'label': 'Analytics',
        'section': 'analytics'
      },
      // SUPPRIMÉ : L'onglet Paramètres
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
      padding: const EdgeInsets.all(6),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final int index = entry.key;
          final Map<String, dynamic> tab = entry.value;
          final bool isActive = currentIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  gradient: isActive
                      ? const LinearGradient(
                          colors: [Color(0xFF4361ee), Color(0xFF7209b7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: const Color(0xFF4361ee).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tab['icon'] as IconData,
                      color: isActive ? Colors.white : Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tab['label'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}