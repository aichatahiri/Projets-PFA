import 'package:flutter/material.dart';

// ========== MODÈLES ==========
class TabItem {
  final String label;
  final IconData icon;

  const TabItem({required this.label, required this.icon});
}

class MaterialNeed {
  final String name;
  final String description;
  final String plannedQuantity;
  final String? actualQuantity;

  const MaterialNeed({
    required this.name,
    required this.description,
    required this.plannedQuantity,
    this.actualQuantity,
  });
}

class Delivery {
  final String material;
  final String quantity;
  final String driver;
  final String status;
  final String eta;
  final Color statusColor;

  const Delivery({
    required this.material,
    required this.quantity,
    required this.driver,
    required this.status,
    required this.eta,
    required this.statusColor,
  });
}

class UrgentRequest {
  final String date;
  final String material;
  final String quantity;
  final String status;
  final String response;

  const UrgentRequest({
    required this.date,
    required this.material,
    required this.quantity,
    required this.status,
    required this.response,
  });
}

// ========== HEADER CHEF DE CHANTIER ==========
class SiteManagerHeader extends StatelessWidget {
  final String userName;
  final String userRole;

  const SiteManagerHeader({
    super.key,
    required this.userName,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo Chef de Chantier
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF4361ee),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.construction,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'BTP Optim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4361ee),
              ),
            ),
          ],
        ),

        // User Info
        Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFF4361ee),
                borderRadius: BorderRadius.all(Radius.circular(22.5)),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  userRole,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6c757d),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// ========== NAV TABS CHEF DE CHANTIER ==========
class SiteManagerNavTabs extends StatelessWidget {
  final List<TabItem> tabs;
  final int currentIndex;
  final Function(int) onTabChanged;

  const SiteManagerNavTabs({
    super.key,
    required this.tabs,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final tab = tabs[index];
          final isSelected = index == currentIndex;
          
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF4361ee) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      tab.icon,
                      color: isSelected ? Colors.white : const Color(0xFF6c757d),
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tab.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : const Color(0xFF6c757d),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ========== PAGE PRINCIPALE CHEF DE CHANTIER ==========
class SiteManagerDashboard extends StatefulWidget {
  const SiteManagerDashboard({super.key});

  @override
  State<SiteManagerDashboard> createState() => _SiteManagerDashboardState();
}

class _SiteManagerDashboardState extends State<SiteManagerDashboard> {
  int _currentIndex = 0;

  // ONGLETS CHEF DE CHANTIER
  final List<TabItem> _tabs = [
    TabItem(label: 'Tableau de bord', icon: Icons.dashboard),
    TabItem(label: 'Gestion des besoins', icon: Icons.list_alt),
    TabItem(label: 'Suivi livraisons', icon: Icons.local_shipping),
    TabItem(label: 'Demandes urgence', icon: Icons.warning),
  ];

  // DONNÉES POUR LES SECTIONS
  final List<MaterialNeed> _materialNeeds = [
    MaterialNeed(
      name: 'Ciment CPJ45',
      description: 'Pour fondations secteur B',
      plannedQuantity: '12 T',
      actualQuantity: '10 T',
    ),
    MaterialNeed(
      name: 'Sable 0/4',
      description: 'Mortier et enduits',
      plannedQuantity: '8 T',
      actualQuantity: '7 T',
    ),
    MaterialNeed(
      name: 'Acier HA8',
      description: 'Ferraillage poutres',
      plannedQuantity: '850 kg',
      actualQuantity: '800 kg',
    ),
    MaterialNeed(
      name: 'Gravier 5/15',
      description: 'Béton dallage',
      plannedQuantity: '15 T',
      actualQuantity: '14 T',
    ),
  ];

  final List<Delivery> _deliveries = [
    Delivery(
      material: 'Ciment 12T',
      quantity: '12 Tonnes',
      driver: 'Karim Benali',
      status: 'En route',
      eta: '10:20',
      statusColor: const Color(0xFF4cc9f0),
    ),
    Delivery(
      material: 'Sable 20T',
      quantity: '20 Tonnes',
      driver: 'Mohamed Amine',
      status: 'Planifiée',
      eta: '13:40',
      statusColor: const Color(0xFF4361ee),
    ),
    Delivery(
      material: 'Gravier 15T',
      quantity: '15 Tonnes',
      driver: 'Rachid Alami',
      status: 'Retard',
      eta: '16:30 ⚠',
      statusColor: const Color(0xFFf72585),
    ),
  ];

  final List<UrgentRequest> _urgentRequests = [
    UrgentRequest(
      date: '14/03/2024 08:30',
      material: 'Ciment CPJ45',
      quantity: '3 Tonnes',
      status: 'Livré',
      response: 'Livraison express confirmée',
    ),
    UrgentRequest(
      date: '13/03/2024 14:15',
      material: 'Acier HA10',
      quantity: '500 Kg',
      status: 'En cours',
      response: 'Préparation en cours',
    ),
    UrgentRequest(
      date: '12/03/2024 10:00',
      material: 'Sable 0/4',
      quantity: '5 Tonnes',
      status: 'Livré',
      response: 'Demande traitée en 2h',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f7fa),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header Chef de Chantier
              const SiteManagerHeader(
                userName: 'Ahmed El Fassi',
                userRole: 'Chef de Chantier - Site A',
              ),
              
              const SizedBox(height: 20),
              
              // Navigation Tabs Chef de Chantier
              SiteManagerNavTabs(
                tabs: _tabs,
                currentIndex: _currentIndex,
                onTabChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              
              const SizedBox(height: 20),
              
              // Content
              _buildCurrentSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentSection() {
    switch (_currentIndex) {
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

  // ========== TABLEAU DE BORD ==========
  Widget _buildDashboardSection() {
    return Column(
      children: [
        // KPI Grid
        _buildKpiGrid(),
        const SizedBox(height: 20),
        // Charts
        _buildChartsSection(),
        const SizedBox(height: 20),
        // Alerts
        _buildAlertsPanel(),
      ],
    );
  }

  Widget _buildKpiGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.8,
      children: [
        _buildKpiCard(
          title: 'Progression chantier',
          value: '68%',
          trend: '+12% ce mois',
          isPositive: true,
          color: const Color(0xFF4361ee),
          icon: Icons.trending_up,
        ),
        _buildKpiCard(
          title: 'Livraisons aujourd\'hui',
          value: '3/5',
          trend: '2 en retard',
          isPositive: false,
          color: const Color(0xFF7209b7),
          icon: Icons.local_shipping,
        ),
        _buildKpiCard(
          title: 'Stock critique',
          value: '2',
          trend: 'Attention nécessaire',
          isPositive: false,
          color: const Color(0xFFf72585),
          icon: Icons.warning,
        ),
        _buildKpiCard(
          title: 'Productivité équipe',
          value: '92%',
          trend: '+5% vs hier',
          isPositive: true,
          color: const Color(0xFF4cc9f0),
          icon: Icons.people,
        ),
      ],
    );
  }

  Widget _buildKpiCard({
    required String title,
    required String value,
    required String trend,
    required bool isPositive,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d), fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
                  child: Icon(icon, color: Colors.white, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(isPositive ? Icons.arrow_upward : Icons.arrow_downward, 
                    color: isPositive ? const Color(0xFF10b981) : const Color(0xFFf72585), size: 12),
                const SizedBox(width: 4),
                Text(trend, style: TextStyle(fontSize: 10, 
                    color: isPositive ? const Color(0xFF10b981) : const Color(0xFFf72585))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartsSection() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Consommation matériaux - 7 jours', 
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            Placeholder(fallbackHeight: 150),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertsPanel() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Alertes chantier', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                CircleAvatar(radius: 12, backgroundColor: Color(0xFFf72585), child: Text('3', style: TextStyle(color: Colors.white, fontSize: 12))),
              ],
            ),
            SizedBox(height: 16),
            _AlertItem(icon: Icons.local_shipping, title: 'Livraison en retard', message: 'Gravier 15T - Retard 45min'),
            SizedBox(height: 12),
            _AlertItem(icon: Icons.inventory, title: 'Stock critique', message: 'Ciment: 2T restants'),
            SizedBox(height: 12),
            _AlertItem(icon: Icons.people, title: 'Équipe sous-effectif', message: '2 ouvriers absents aujourd\'hui'),
          ],
        ),
      ),
    );
  }

  // ========== GESTION DES BESOINS ==========
  Widget _buildNeedsSection() {
    return Column(
      children: [
        // Besoins prévus par IA
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Besoins prévus par IA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Icon(Icons.auto_awesome, color: Color(0xFF4361ee)),
                  ],
                ),
                const SizedBox(height: 16),
                ..._materialNeeds.map((need) => _buildMaterialNeedItem(need)).toList(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Saisie des besoins réels
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Saisie des besoins réels', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Icon(Icons.edit, color: Color(0xFF4361ee)),
                  ],
                ),
                const SizedBox(height: 16),
                ..._materialNeeds.map((need) => _buildRealNeedItem(need)).toList(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4361ee),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Enregistrer les modifications', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialNeedItem(MaterialNeed need) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: Color(0xFF4361ee), width: 4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(need.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Text(need.description, style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(need.plannedQuantity, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Text('Prévu par IA', style: TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRealNeedItem(MaterialNeed need) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f9fa),
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: Color(0xFF4361ee), width: 4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(need.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Text('Quantité réellement utilisée', style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: TextFormField(
              initialValue: need.actualQuantity?.replaceAll(' T', '').replaceAll(' kg', ''),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(need.plannedQuantity.contains('kg') ? 'kg' : 'T', 
               style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
        ],
      ),
    );
  }

  // ========== SUIVI LIVRAISONS ==========
  Widget _buildDeliveriesSection() {
    return Column(
      children: [
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Livraisons en cours', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Row(
                      children: [
                        OutlinedButton(onPressed: null, child: Text('Filtrer')),
                        SizedBox(width: 8),
                        ElevatedButton(onPressed: null, child: Text('Historique')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ..._deliveries.map((delivery) => _buildDeliveryItem(delivery)).toList(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Statut des livraisons - Aujourd\'hui', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 16),
                Placeholder(fallbackHeight: 150),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryItem(Delivery delivery) {
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
                Text(delivery.material, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Text(delivery.quantity, style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
                Text('Chauffeur: ${delivery.driver}', style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: delivery.statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(delivery.status, style: TextStyle(color: delivery.statusColor, fontSize: 10, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 4),
              Text(delivery.eta, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: delivery.statusColor == const Color(0xFFf72585) ? const Color(0xFFf72585) : Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  // ========== DEMANDES URGENCE ==========
  Widget _buildUrgencySection() {
    return Column(
      children: [
        // Formulaire de demande urgente
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Demande de livraison urgente', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                const TextField(decoration: InputDecoration(labelText: 'Matériau demandé', border: OutlineInputBorder())),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: TextField(decoration: InputDecoration(labelText: 'Quantité', border: OutlineInputBorder()))),
                    const SizedBox(width: 16),
                    Expanded(child: TextField(decoration: InputDecoration(labelText: 'Unité', border: OutlineInputBorder()))),
                  ],
                ),
                const SizedBox(height: 16),
                const TextField(decoration: InputDecoration(labelText: 'Motif de l\'urgence', border: OutlineInputBorder()), maxLines: 3),
                const SizedBox(height: 16),
                const TextField(decoration: InputDecoration(labelText: 'Délai maximum', border: OutlineInputBorder())),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Annuler'))),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFf72585)),
                        onPressed: () {},
                        child: const Text('Envoyer demande urgente', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Historique des demandes
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Historique des demandes urgentes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                ..._urgentRequests.map((request) => _buildUrgentRequestItem(request)).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUrgentRequestItem(UrgentRequest request) {
    final isDelivered = request.status == 'Livré';
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
              Text(request.date, style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDelivered ? const Color(0xFF10b981).withOpacity(0.1) : const Color(0xFF4cc9f0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(request.status, style: TextStyle(color: isDelivered ? const Color(0xFF10b981) : const Color(0xFF4cc9f0), fontSize: 10, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('${request.material} - ${request.quantity}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(request.response, style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
        ],
      ),
    );
  }
}

// ========== WIDGET ALERT ITEM ==========
class _AlertItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const _AlertItem({
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFf72585), size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Text(message, style: const TextStyle(fontSize: 12, color: Color(0xFF6c757d))),
            ],
          ),
        ),
      ],
    );
  }
}