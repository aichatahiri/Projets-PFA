class SiteAlert {
  final String id;
  final String title;
  final String message;
  final AlertType type;
  final DateTime timestamp;
  final bool isActive;

  SiteAlert({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    this.isActive = true,
  });
}

enum AlertType {
  delivery,
  stock,
  team,
  safety,
  equipment
}