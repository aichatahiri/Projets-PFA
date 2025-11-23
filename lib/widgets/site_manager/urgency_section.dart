import 'package:flutter/material.dart';

class UrgencySection extends StatefulWidget {
  const UrgencySection({super.key});

  @override
  State<UrgencySection> createState() => _UrgencySectionState();
}

class _UrgencySectionState extends State<UrgencySection> {
  final _formKey = GlobalKey<FormState>();
  String _selectedMaterial = '';
  String _selectedUnit = 'tonnes';
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Urgency Form
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Demande de livraison urgente',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Material Selection
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Matériau demandé',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedMaterial.isEmpty ? null : _selectedMaterial,
                    items: const [
                      DropdownMenuItem(value: 'ciment', child: Text('Ciment')),
                      DropdownMenuItem(value: 'sable', child: Text('Sable')),
                      DropdownMenuItem(value: 'acier', child: Text('Acier')),
                      DropdownMenuItem(value: 'gravier', child: Text('Gravier')),
                      DropdownMenuItem(value: 'briques', child: Text('Briques')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value!;
                      });
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Quantity and Unit
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _quantityController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Quantité',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Unité',
                            border: OutlineInputBorder(),
                          ),
                          value: _selectedUnit,
                          items: const [
                            DropdownMenuItem(value: 'tonnes', child: Text('T')),
                            DropdownMenuItem(value: 'kg', child: Text('Kg')),
                            DropdownMenuItem(value: 'm3', child: Text('m³')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedUnit = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Reason
                  TextFormField(
                    controller: _reasonController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Motif de l\'urgence',
                      border: OutlineInputBorder(),
                      hintText: 'Décrivez la situation urgente...',
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _quantityController.clear();
                            _reasonController.clear();
                            setState(() {
                              _selectedMaterial = '';
                            });
                          },
                          child: const Text('Annuler'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFf72585),
                          ),
                          onPressed: _sendUrgentRequest,
                          child: const Text('Envoyer'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // History
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
                const Text(
                  'Historique des demandes urgentes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const UrgencyHistoryItem(
                  date: '14/03/2024 08:30',
                  material: 'Ciment CPJ45',
                  quantity: '3 Tonnes',
                  status: 'Livré',
                  response: 'Livraison express confirmée',
                  isDelivered: true,
                ),
                const UrgencyHistoryItem(
                  date: '13/03/2024 14:15',
                  material: 'Acier HA10',
                  quantity: '500 Kg',
                  status: 'En cours',
                  response: 'Préparation en cours',
                  isDelivered: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _sendUrgentRequest() {
    if (_formKey.currentState!.validate()) {
      // Envoyer la demande
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demande urgente envoyée !'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Réinitialiser le formulaire
      _quantityController.clear();
      _reasonController.clear();
      setState(() {
        _selectedMaterial = '';
      });
    }
  }
}

class UrgencyHistoryItem extends StatelessWidget {
  final String date;
  final String material;
  final String quantity;
  final String status;
  final String response;
  final bool isDelivered;

  const UrgencyHistoryItem({
    super.key,
    required this.date,
    required this.material,
    required this.quantity,
    required this.status,
    required this.response,
    required this.isDelivered,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6c757d),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDelivered 
                      ? const Color(0xFF10b981).withOpacity(0.1)
                      : const Color(0xFF4cc9f0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isDelivered ? const Color(0xFF10b981) : const Color(0xFF4cc9f0),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$material - $quantity',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            response,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6c757d),
            ),
          ),
        ],
      ),
    );
  }
}