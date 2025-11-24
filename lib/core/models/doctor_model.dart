class Doctor {
  final String id;
  final String userId;
  final String specialty;
  final String qualification;
  final int experienceYears;
  final String clinicName;
  final String clinicAddress;
  final double latitude;
  final double longitude;
  final String workingHoursStart;
  final String workingHoursEnd;
  final double consultationFee;
  final double rating;
  final int totalRatings;
  final String? bio;

  Doctor({
    required this.id,
    required this.userId,
    required this.specialty,
    required this.qualification,
    required this.experienceYears,
    required this.clinicName,
    required this.clinicAddress,
    required this.latitude,
    required this.longitude,
    required this.workingHoursStart,
    required this.workingHoursEnd,
    required this.consultationFee,
    this.rating = 0.0,
    this.totalRatings = 0,
    this.bio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'specialty': specialty,
      'qualification': qualification,
      'experience_years': experienceYears,
      'clinic_name': clinicName,
      'clinic_address': clinicAddress,
      'latitude': latitude,
      'longitude': longitude,
      'working_hours_start': workingHoursStart,
      'working_hours_end': workingHoursEnd,
      'consultation_fee': consultationFee,
      'rating': rating,
      'total_ratings': totalRatings,
      'bio': bio,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'],
      userId: map['user_id'],
      specialty: map['specialty'],
      qualification: map['qualification'],
      experienceYears: map['experience_years'],
      clinicName: map['clinic_name'],
      clinicAddress: map['clinic_address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      workingHoursStart: map['working_hours_start'],
      workingHoursEnd: map['working_hours_end'],
      consultationFee: map['consultation_fee'],
      rating: map['rating'] ?? 0.0,
      totalRatings: map['total_ratings'] ?? 0,
      bio: map['bio'],
    );
  }
}
