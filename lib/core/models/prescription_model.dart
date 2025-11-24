class Prescription {
  final String id;
  final String patientId;
  final String doctorId;
  final String? appointmentId;
  final DateTime prescriptionDate;
  final String diagnosis;
  final List<PrescriptionMedicine> medicines;
  final String? additionalNotes;
  final String? prescriptionImage; // Path to image if uploaded
  final DateTime createdAt;

  Prescription({
    required this.id,
    required this.patientId,
    required this.doctorId,
    this.appointmentId,
    required this.prescriptionDate,
    required this.diagnosis,
    required this.medicines,
    this.additionalNotes,
    this.prescriptionImage,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'appointment_id': appointmentId,
      'prescription_date': prescriptionDate.toIso8601String(),
      'diagnosis': diagnosis,
      'medicines': medicines.map((m) => m.toMap()).toList(),
      'additional_notes': additionalNotes,
      'prescription_image': prescriptionImage,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    return Prescription(
      id: map['id'],
      patientId: map['patient_id'],
      doctorId: map['doctor_id'],
      appointmentId: map['appointment_id'],
      prescriptionDate: DateTime.parse(map['prescription_date']),
      diagnosis: map['diagnosis'],
      medicines: (map['medicines'] as List)
          .map((m) => PrescriptionMedicine.fromMap(m))
          .toList(),
      additionalNotes: map['additional_notes'],
      prescriptionImage: map['prescription_image'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}

class PrescriptionMedicine {
  final String medicineName;
  final String dosage;
  final String frequency;
  final int durationDays;
  final String? instructions;

  PrescriptionMedicine({
    required this.medicineName,
    required this.dosage,
    required this.frequency,
    required this.durationDays,
    this.instructions,
  });

  Map<String, dynamic> toMap() {
    return {
      'medicine_name': medicineName,
      'dosage': dosage,
      'frequency': frequency,
      'duration_days': durationDays,
      'instructions': instructions,
    };
  }

  factory PrescriptionMedicine.fromMap(Map<String, dynamic> map) {
    return PrescriptionMedicine(
      medicineName: map['medicine_name'],
      dosage: map['dosage'],
      frequency: map['frequency'],
      durationDays: map['duration_days'],
      instructions: map['instructions'],
    );
  }
}
