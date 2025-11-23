class Mission {
  final String id;
  final String chantier;
  final String chauffeur;
  final String materiaux;
  final String eta;
  final String status;
  final String priority;
  final DateTime date;

  Mission({
    required this.id,
    required this.chantier,
    required this.chauffeur,
    required this.materiaux,
    required this.eta,
    required this.status,
    required this.priority,
    required this.date,
  });
}