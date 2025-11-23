import 'package:flutter/material.dart';

class NeedsSection extends StatelessWidget {
  const NeedsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AI Predicted Needs
        Card(
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
                      'Besoins prévus par IA',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh, size: 16),
                      label: const Text('Actualiser'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const MaterialNeedItem(
                  material: 'Ciment CPJ45',
                  description: 'Pour fondations secteur B',
                  quantity: '12 T',
                  source: 'Prévu par IA',
                ),
                const MaterialNeedItem(
                  material: 'Sable 0/4',
                  description: 'Mortier et enduits',
                  quantity: '8 T',
                  source: 'Prévu par IA',
                ),
                const MaterialNeedItem(
                  material: 'Acier HA8',
                  description: 'Ferraillage poutres',
                  quantity: '850 kg',
                  source: 'Prévu par IA',
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Real Needs Form
        Card(
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
                      'Saisie des besoins réels',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save, size: 16),
                      label: const Text('Enregistrer'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const RealNeedItem(
                  material: 'Ciment CPJ45',
                  description: 'Quantité réellement utilisée',
                  initialValue: 12,
                  unit: 'Tonnes',
                ),
                const RealNeedItem(
                  material: 'Sable 0/4',
                  description: 'Quantité réellement utilisée',
                  initialValue: 7,
                  unit: 'Tonnes',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MaterialNeedItem extends StatelessWidget {
  final String material;
  final String description;
  final String quantity;
  final String source;

  const MaterialNeedItem({
    super.key,
    required this.material,
    required this.description,
    required this.quantity,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF4361ee),
            width: 4,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  description,
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
              Text(
                quantity,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                source,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6c757d),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RealNeedItem extends StatefulWidget {
  final String material;
  final String description;
  final int initialValue;
  final String unit;

  const RealNeedItem({
    super.key,
    required this.material,
    required this.description,
    required this.initialValue,
    required this.unit,
  });

  @override
  State<RealNeedItem> createState() => _RealNeedItemState();
}

class _RealNeedItemState extends State<RealNeedItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF4361ee),
            width: 4,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.material,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.description,
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
              SizedBox(
                width: 80,
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Text(
                widget.unit,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6c757d),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}