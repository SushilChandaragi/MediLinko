class Medicine {
  final String id;
  final String name;
  final String genericName;
  final String category;
  final String manufacturer;
  final String description;
  final double price;
  final bool requiresPrescription;
  final DateTime createdAt;

  Medicine({
    required this.id,
    required this.name,
    required this.genericName,
    required this.category,
    required this.manufacturer,
    required this.description,
    required this.price,
    required this.requiresPrescription,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'generic_name': genericName,
      'category': category,
      'manufacturer': manufacturer,
      'description': description,
      'price': price,
      'requires_prescription': requiresPrescription ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'],
      name: map['name'],
      genericName: map['generic_name'],
      category: map['category'],
      manufacturer: map['manufacturer'],
      description: map['description'],
      price: map['price'],
      requiresPrescription: map['requires_prescription'] == 1,
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}

class MedicineBatch {
  final String id;
  final String medicineId;
  final String pharmacistId;
  final String batchNumber;
  final int quantity;
  final int remainingQuantity;
  final DateTime manufacturingDate;
  final DateTime expiryDate;
  final double purchasePrice;
  final double sellingPrice;
  final DateTime createdAt;
  final DateTime? updatedAt;

  MedicineBatch({
    required this.id,
    required this.medicineId,
    required this.pharmacistId,
    required this.batchNumber,
    required this.quantity,
    required this.remainingQuantity,
    required this.manufacturingDate,
    required this.expiryDate,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.createdAt,
    this.updatedAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiryDate);
  
  int get daysUntilExpiry => expiryDate.difference(DateTime.now()).inDays;
  
  bool get isNearExpiry => daysUntilExpiry <= 30 && daysUntilExpiry > 0;
  
  bool get isCriticalExpiry => daysUntilExpiry <= 7 && daysUntilExpiry > 0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medicine_id': medicineId,
      'pharmacist_id': pharmacistId,
      'batch_number': batchNumber,
      'quantity': quantity,
      'remaining_quantity': remainingQuantity,
      'manufacturing_date': manufacturingDate.toIso8601String(),
      'expiry_date': expiryDate.toIso8601String(),
      'purchase_price': purchasePrice,
      'selling_price': sellingPrice,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory MedicineBatch.fromMap(Map<String, dynamic> map) {
    return MedicineBatch(
      id: map['id'],
      medicineId: map['medicine_id'],
      pharmacistId: map['pharmacist_id'],
      batchNumber: map['batch_number'],
      quantity: map['quantity'],
      remainingQuantity: map['remaining_quantity'],
      manufacturingDate: DateTime.parse(map['manufacturing_date']),
      expiryDate: DateTime.parse(map['expiry_date']),
      purchasePrice: map['purchase_price'],
      sellingPrice: map['selling_price'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: map['updated_at'] != null 
          ? DateTime.parse(map['updated_at']) 
          : null,
    );
  }

  MedicineBatch copyWith({
    String? id,
    String? medicineId,
    String? pharmacistId,
    String? batchNumber,
    int? quantity,
    int? remainingQuantity,
    DateTime? manufacturingDate,
    DateTime? expiryDate,
    double? purchasePrice,
    double? sellingPrice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MedicineBatch(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      pharmacistId: pharmacistId ?? this.pharmacistId,
      batchNumber: batchNumber ?? this.batchNumber,
      quantity: quantity ?? this.quantity,
      remainingQuantity: remainingQuantity ?? this.remainingQuantity,
      manufacturingDate: manufacturingDate ?? this.manufacturingDate,
      expiryDate: expiryDate ?? this.expiryDate,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
