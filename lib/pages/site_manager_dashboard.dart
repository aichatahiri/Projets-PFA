import 'package:flutter/material.dart';

class SiteManagerDashboard extends StatefulWidget {
  const SiteManagerDashboard({super.key, required Map<String, String> userData});

  @override
  State<SiteManagerDashboard> createState() => _SiteManagerDashboardState();
}

class _SiteManagerDashboardState extends State<SiteManagerDashboard> {
  int _currentSection = 0;
  String? _selectedMaterial;
  String? _selectedUnit;
  DateTime? _selectedDate;

  final List<Map<String, dynamic>> _tabs = [
    {
      'icon': Icons.dashboard,
      'label': 'Tableau de bord',
    },
    {
      'icon': Icons.list_alt,
      'label': 'Besoins',
    },
    {
      'icon': Icons.local_shipping,
      'label': 'Livraisons',
    },
    {
      'icon': Icons.warning,
      'label': 'Urgence',
    },
  ];

  // Liste des matériaux disponibles
  final List<String> _materials = [
    'Ciment CPJ45',
    'Sable 0/4',
    'Acier HA8',
    'Acier HA10',
    'Gravier 5/15',
    'Béton prêt à l\'emploi',
    'Tuyaux PVC',
    'Briques'
  ];

  // Liste des unités disponibles
  final List<String> _units = [
    'Tonnes',
    'Kg',
    'm³',
    'Litre',
    'Unité',
    'Paquet'
  ];

  // Données pour les besoins
  final List<Map<String, dynamic>> _iaNeeds = [
    {'material': 'Ciment CPJ45', 'quantity': '12 T', 'desc': 'Pour fondations secteur B'},
    {'material': 'Sable 0/4', 'quantity': '8 T', 'desc': 'Mortier et enduits'},
    {'material': 'Acier HA8', 'quantity': '850 kg', 'desc': 'Ferraillage poutres'},
    {'material': 'Gravier 5/15', 'quantity': '15 T', 'desc': 'Béton dallage'},
  ];

  final List<Map<String, dynamic>> _realNeeds = [
    {'material': 'Ciment CPJ45', 'quantity': '12', 'unit': 'Tonnes'},
    {'material': 'Sable 0/4', 'quantity': '7', 'unit': 'Tonnes'},
    {'material': 'Acier HA8', 'quantity': '800', 'unit': 'Kg'},
    {'material': 'Gravier 5/15', 'quantity': '14', 'unit': 'Tonnes'},
  ];

  // Données pour les livraisons
  final List<Map<String, dynamic>> _deliveries = [
    {'material': 'Ciment 12T', 'quantity': '12 Tonnes', 'driver': 'Karim Benali', 'status': 'En route', 'eta': '10:20'},
    {'material': 'Sable 20T', 'quantity': '20 Tonnes', 'driver': 'Mohamed Amine', 'status': 'Planifiée', 'eta': '13:40'},
    {'material': 'Acier 2T', 'quantity': '2 Tonnes', 'driver': 'Hassan Idrissi', 'status': 'Livré', 'eta': '09:15 ✓'},
    {'material': 'Gravier 15T', 'quantity': '15 Tonnes', 'driver': 'Rachid Alami', 'status': 'Retard', 'eta': '16:30 ⚠', 'isDelayed': true},
  ];

  // Données pour les demandes urgentes
  final List<Map<String, dynamic>> _urgentRequests = [
    {'date': '14/03/2024 08:30', 'material': 'Ciment CPJ45', 'quantity': '3 Tonnes', 'status': 'Livré', 'response': 'Livraison express confirmée'},
    {'date': '13/03/2024 14:15', 'material': 'Acier HA10', 'quantity': '500 Kg', 'status': 'En cours', 'response': 'Préparation en cours'},
    {'date': '12/03/2024 10:00', 'material': 'Sable 0/4', 'quantity': '5 Tonnes', 'status': 'Livré', 'response': 'Demande traitée en 2h'},
  ];

  // Contrôleurs pour le formulaire d'urgence
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  Widget _buildCurrentSection() {
    switch (_currentSection) {
      case 0:
        return _buildDashboardSection();
      case 1:
        return _buildNeedsSection();
      case 2:
        return _buildDeliveriesSection();
      case 3:
        return _buildUrgencySection();
      default:
        return _buildDashboardSection();
    }
  }

  Widget _buildDashboardSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildKpiGrid(),
          const SizedBox(height: 16),
          _buildChartsSection(),
        ],
      ),
    );
  }

  Widget _buildKpiGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: [
        _buildKpiCard(
          'Progression chantier',
          '68%',
          Icons.trending_up,
          Colors.green,
          '+12% ce mois',
        ),
        _buildKpiCard(
          'Livraisons aujourd\'hui',
          '3/5',
          Icons.local_shipping,
          Colors.orange,
          '2 en retard',
        ),
        _buildKpiCard(
          'Stock critique',
          '2',
          Icons.warning,
          Colors.red,
          'Attention nécessaire',
        ),
        _buildKpiCard(
          'Productivité équipe',
          '92%',
          Icons.people,
          Colors.blue,
          '+5% vs hier',
        ),
      ],
    );
  }

  Widget _buildKpiCard(String title, String value, IconData icon, Color color, String trend) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6c757d),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            trend,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection() {
    return Column(
      children: [
        _buildChartCard(
          'Consommation matériaux - 7 jours',
          Icons.bar_chart,
        ),
        const SizedBox(height: 12),
        _buildChartCard(
          'Évolution des besoins',
          Icons.show_chart,
        ),
      ],
    );
  }

  Widget _buildChartCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212529),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4361EE),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      minimumSize: Size.zero,
                    ),
                    child: const Text(
                      'Semaine',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4361EE),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      minimumSize: Size.zero,
                    ),
                    child: const Text(
                      'Mois',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFf8f9fa), Color(0xFFe9ecef)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: const Color(0xFF4361EE),
                ),
                const SizedBox(height: 8),
                Text(
                  title.contains('Consommation') ? 'Graphique de consommation' : 'Courbe d\'évolution',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
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

  Widget _buildNeedsSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildNeedsCard(
            'Besoins prévus par IA',
            _iaNeeds,
            showRefreshButton: true,
          ),
          const SizedBox(height: 12),
          _buildNeedsCard(
            'Saisie des besoins réels', 
            _realNeeds,
            isEditable: true,
            showSaveButton: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNeedsCard(String title, List<Map<String, dynamic>> needs, {
    bool isEditable = false, 
    bool showRefreshButton = false,
    bool showSaveButton = false
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212529),
                ),
              ),
              if (showRefreshButton)
                ElevatedButton.icon(
                  onPressed: _refreshIANeeds,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4361EE),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  ),
                  icon: const Icon(Icons.refresh, size: 14),
                  label: const Text('Actualiser'),
                )
              else if (showSaveButton)
                ElevatedButton.icon(
                  onPressed: _saveRealNeeds,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4361EE),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  ),
                  icon: const Icon(Icons.save, size: 14),
                  label: const Text('Enregistrer'),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: needs.map((need) => _buildNeedItem(need, isEditable)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNeedItem(Map<String, dynamic> need, bool isEditable) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(8),
        border: const Border(left: BorderSide(color: Color(0xFF4361EE), width: 3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  need['material'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  need['desc'] ?? 'Quantité réellement utilisée',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6c757d),
                  ),
                ),
              ],
            ),
          ),
          if (isEditable)
            SizedBox(
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: TextEditingController(text: need['quantity']),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    need['unit'] ?? 'Tonnes',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF6c757d),
                    ),
                  ),
                ],
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  need['quantity'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Prévu par IA',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6c757d),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildDeliveriesSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Livraisons en cours',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212529),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF4361EE),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          ),
                          icon: const Icon(Icons.filter_alt, size: 14),
                          label: const Text('Filtrer'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: _showDeliveryHistory,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4361EE),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          ),
                          icon: const Icon(Icons.history, size: 14),
                          label: const Text('Historique'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: _deliveries.map((delivery) => _buildDeliveryItem(delivery)).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _buildDeliveryStatsCard(),
        ],
      ),
    );
  }

  Widget _buildDeliveryItem(Map<String, dynamic> delivery) {
    Color statusColor = const Color(0xFF4cc9f0);
    if (delivery['status'] == 'Livré') statusColor = Colors.green;
    if (delivery['status'] == 'Retard') statusColor = Colors.red;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  delivery['material'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${delivery['quantity']} • ${delivery['driver']}',
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
                  delivery['status'],
                  style: TextStyle(
                    fontSize: 10,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                delivery['eta'],
                style: TextStyle(
                  fontSize: 12,
                  color: delivery['isDelayed'] == true ? Colors.red : const Color(0xFF6c757d),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryStatsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Statut des livraisons - Aujourd\'hui',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212529),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFf8f9fa), Color(0xFFe9ecef)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.pie_chart,
                  size: 32,
                  color: Color(0xFF4361EE),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Graphique des statuts de livraison',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
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

  Widget _buildUrgencySection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildUrgencyForm(),
          const SizedBox(height: 12),
          _buildUrgencyHistory(),
        ],
      ),
    );
  }

  Widget _buildUrgencyForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Demande de livraison urgente',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 16),
          
          // Sélection du matériau
          _buildMaterialDropdown(),
          const SizedBox(height: 12),
          
          // Quantité et Unité
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildSquareFormField('Quantité', Icons.scale, _quantityController),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _buildUnitDropdown(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Délai maximum
          _buildDateField(),
          const SizedBox(height: 12),
          
          // Motif de l'urgence
          _buildSquareFormField('Motif de l\'urgence', Icons.description, _reasonController, isTextArea: true),
          const SizedBox(height: 16),
          
          // Boutons
          Row(
            children: [
              Expanded(
                child: _buildSquareButton(
                  text: 'Annuler',
                  icon: Icons.cancel,
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFF4361EE),
                  onPressed: _cancelUrgentRequest,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSquareButton(
                  text: 'Envoyer demande urgente',
                  icon: Icons.send,
                  backgroundColor: const Color(0xFFf72585),
                  textColor: Colors.white,
                  onPressed: _sendUrgentRequest,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Matériau demandé',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6c757d),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Row(
            children: [
              const Icon(Icons.construction, size: 18, color: Color(0xFF4361EE)),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButton<String>(
                  value: _selectedMaterial,
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4361EE)),
                  hint: const Text(
                    'Sélectionnez un matériau',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6c757d),
                    ),
                  ),
                  items: _materials.map((String material) {
                    return DropdownMenuItem<String>(
                      value: material,
                      child: Text(material),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMaterial = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUnitDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Unité',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6c757d),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Row(
            children: [
              const Icon(Icons.straighten, size: 18, color: Color(0xFF4361EE)),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButton<String>(
                  value: _selectedUnit,
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4361EE)),
                  hint: const Text(
                    'Unité',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6c757d),
                    ),
                  ),
                  items: _units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedUnit = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Délai maximum',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6c757d),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, size: 18, color: Color(0xFF4361EE)),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: _selectDate,
                  child: Text(
                    _selectedDate != null 
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : 'jj/mm/aaaa --:--',
                    style: TextStyle(
                      fontSize: 14,
                      color: _selectedDate != null ? Colors.black : const Color(0xFF6c757d),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSquareFormField(String label, IconData icon, TextEditingController controller, {bool isTextArea = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6c757d),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: isTextArea ? 100 : 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFF4361EE)),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: isTextArea ? 3 : 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: label == 'Quantité' ? 'Ex: 5' : 'Décrivez la situation urgente...',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6c757d),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSquareButton({
    required String text,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: textColor == Colors.white ? Colors.transparent : const Color(0xFF4361EE),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: textColor),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUrgencyHistory() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Historique des demandes urgentes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212529),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: _urgentRequests.map((request) => _buildSquareHistoryItem(request)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareHistoryItem(Map<String, dynamic> request) {
    Color statusColor = const Color(0xFF4cc9f0);
    if (request['status'] == 'Livré') statusColor = Colors.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${request['date']} - ${request['material']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${request['quantity']} - ${request['response']}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6c757d),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: statusColor.withOpacity(0.3)),
            ),
            child: Text(
              request['status'],
              style: TextStyle(
                fontSize: 10,
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Méthodes pour les actions
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _refreshIANeeds() {
    setState(() {
      // Simulation de rafraîchissement des données IA
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Besoins IA actualisés')),
    );
  }

  void _saveRealNeeds() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Besoins réels enregistrés')),
    );
  }

  void _showDeliveryHistory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Historique des livraisons'),
          content: const Text('Fonctionnalité historique en cours de développement...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _sendUrgentRequest() {
    if (_selectedMaterial == null || _quantityController.text.isEmpty || _reasonController.text.isEmpty || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Demande envoyée'),
          content: const Text('Votre demande urgente a été envoyée avec succès.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _cancelUrgentRequest();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _cancelUrgentRequest() {
    setState(() {
      _selectedMaterial = null;
      _selectedUnit = null;
      _selectedDate = null;
    });
    _quantityController.clear();
    _reasonController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f7fa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Header simplifié pour mobile
              _buildMobileHeader(),
              const SizedBox(height: 16),
              
              // Navigation Tabs
              _buildMobileNavTabs(),
              const SizedBox(height: 16),
              
              // Main Content
              Expanded(
                child: _buildCurrentSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4361EE), Color(0xFF7209B7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.construction,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed El Fassi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212529),
                  ),
                ),
                Text(
                  'Chef de Chantier - Site A',
                  style: TextStyle(
                    color: Color(0xFF6c757d),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isActive = index == _currentSection;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentSection = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  gradient: isActive
                      ? const LinearGradient(
                          colors: [Color(0xFF4361EE), Color(0xFF7209B7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  color: isActive ? null : Colors.transparent,
                ),
                child: Column(
                  children: [
                    Icon(
                      tab['icon'],
                      color: isActive ? Colors.white : const Color(0xFF6c757d),
                      size: 16,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tab['label'],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : const Color(0xFF6c757d),
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

  @override
  void dispose() {
    _quantityController.dispose();
    _reasonController.dispose();
    super.dispose();
  }
}