import 'dart:ui';

enum DeliveryStatus {
  planned,
  inProgress,
  delivered,
  delayed,
  urgent
}

class Delivery {
  final String id;
  final String material;
  final double quantity;
  final String driver;
  final DeliveryStatus status;
  final DateTime estimatedArrival;
  final String unit;

  Delivery({
    required this.id,
    required this.material,
    required this.quantity,
    required this.driver,
    required this.status,
    required this.estimatedArrival,
    required this.unit,
  });

  String get statusText {
    switch (status) {
      case DeliveryStatus.planned: return 'Planifiée';
      case DeliveryStatus.inProgress: return 'En route';
      case DeliveryStatus.delivered: return 'Livré';
      case DeliveryStatus.delayed: return 'Retard';
      case DeliveryStatus.urgent: return 'Urgent';
    }
  }

  Color get statusColor {
    switch (status) {
      case DeliveryStatus.planned: return const Color(0xFF4361ee);
      case DeliveryStatus.inProgress: return const Color(0xFF4cc9f0);
      case DeliveryStatus.delivered: return const Color(0xFF10b981);
      case DeliveryStatus.delayed: return const Color(0xFFf72585);
      case DeliveryStatus.urgent: return const Color(0xFFe63946);
    }
  }
}