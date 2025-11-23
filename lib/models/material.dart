class ConstructionMaterial {
  final String id;
  final String name;
  final String description;
  final double plannedQuantity;
  final double actualQuantity;
  final String unit;
  final String category;

  ConstructionMaterial({
    required this.id,
    required this.name,
    required this.description,
    required this.plannedQuantity,
    required this.actualQuantity,
    required this.unit,
    required this.category,
  });
}

class MaterialNeed {
  final ConstructionMaterial material;
  final double plannedAmount;
  final double? actualAmount;
  final DateTime date;
  final String siteZone;

  MaterialNeed({
    required this.material,
    required this.plannedAmount,
    this.actualAmount,
    required this.date,
    required this.siteZone,
  });
}