class Patient {
  final String id;
  final String userId;
  final DateTime dateOfBirth;
  final String gender;
  final String bloodGroup;
  final double height; // in cm
  final double weight; // in kg
  final String address;
  final String? allergies;
  final String? chronicDiseases;
  final String? emergencyContactName;
  final String? emergencyContactPhone;

  Patient({
    required this.id,
    required this.userId,
    required this.dateOfBirth,
    required this.gender,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.address,
    this.allergies,
    this.chronicDiseases,
    this.emergencyContactName,
    this.emergencyContactPhone,
  });

  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  double get bmi {
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'blood_group': bloodGroup,
      'height': height,
      'weight': weight,
      'address': address,
      'allergies': allergies,
      'chronic_diseases': chronicDiseases,
      'emergency_contact_name': emergencyContactName,
      'emergency_contact_phone': emergencyContactPhone,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      userId: map['user_id'],
      dateOfBirth: DateTime.parse(map['date_of_birth']),
      gender: map['gender'],
      bloodGroup: map['blood_group'],
      height: map['height'],
      weight: map['weight'],
      address: map['address'],
      allergies: map['allergies'],
      chronicDiseases: map['chronic_diseases'],
      emergencyContactName: map['emergency_contact_name'],
      emergencyContactPhone: map['emergency_contact_phone'],
    );
  }
}
