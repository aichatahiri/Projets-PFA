import 'package:flutter/material.dart';

class DeliveriesSection extends StatelessWidget {
  const DeliveriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Livraisons en cours',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Filtrer'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Historique'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const DeliveryItem(
                  material: 'Ciment 12T',
                  quantity: '12 Tonnes',
                  driver: 'Karim Benali',
                  status: 'En route',
                  eta: '10:20',
                  statusColor: Color(0xFF4cc9f0),
                ),
                const DeliveryItem(
                  material: 'Sable 20T',
                  quantity: '20 Tonnes',
                  driver: 'Mohamed Amine',
                  status: 'Planifiée',
                  eta: '13:40',
                  statusColor: Color(0xFF4361ee),
                ),
                const DeliveryItem(
                  material: 'Gravier 15T',
                  quantity: '15 Tonnes',
                  driver: 'Rachid Alami',
                  status: 'Retard',
                  eta: '16:30 ⚠',
                  statusColor: Color(0xFFf72585),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DeliveryItem extends StatelessWidget {
  final String material;
  final String quantity;
  final String driver;
  final String status;
  final String eta;
  final Color statusColor;

  const DeliveryItem({
    super.key,
    required this.material,
    required this.quantity,
    required this.driver,
    required this.status,
    required this.eta,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  material,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  quantity,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6c757d),
                  ),
                ),
                Text(
                  'Chauffeur: $driver',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6c757d),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                eta,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: statusColor == const Color(0xFFf72585) 
                      ? const Color(0xFFf72585) 
                      : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}