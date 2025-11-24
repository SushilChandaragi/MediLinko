class AppConstants {
  // App Info
  static const String appName = 'Medilinko';
  static const String appTagline = 'Stay linked and stay healthy';
  static const String appVersion = '1.0.0';

  // User Roles
  static const String roleDoctor = 'doctor';
  static const String rolePharmacist = 'pharmacist';
  static const String rolePatient = 'patient';

  // Routes
  static const String loginRoute = '/';
  static const String doctorDashboardRoute = '/doctor-dashboard';
  static const String pharmacistDashboardRoute = '/pharmacist-dashboard';
  static const String patientDashboardRoute = '/patient-dashboard';

  // Doctor Routes
  static const String doctorAppointmentsRoute = '/doctor/appointments';
  static const String patientProfileRoute = '/doctor/patient-profile';
  static const String createPrescriptionRoute = '/doctor/create-prescription';

  // Pharmacist Routes
  static const String medicineInventoryRoute = '/pharmacist/inventory';
  static const String addBatchRoute = '/pharmacist/add-batch';
  static const String expiryAlertsRoute = '/pharmacist/expiry-alerts';

  // Patient Routes
  static const String searchDoctorsRoute = '/patient/search-doctors';
  static const String bookAppointmentRoute = '/patient/book-appointment';
  static const String myPrescriptionsRoute = '/patient/prescriptions';
  static const String searchMedicinesRoute = '/patient/search-medicines';
  static const String patientProfileEditRoute = '/patient/profile-edit';

  // Shared Preferences Keys
  static const String keyUserId = 'user_id';
  static const String keyUserRole = 'user_role';
  static const String keyUserName = 'user_name';
  static const String keyUserEmail = 'user_email';
  static const String keyIsLoggedIn = 'is_logged_in';

  // Database
  static const String databaseName = 'medilinko.db';
  static const int databaseVersion = 1;

  // Table Names
  static const String tableUsers = 'users';
  static const String tableDoctors = 'doctors';
  static const String tablePharmacists = 'pharmacists';
  static const String tablePatients = 'patients';
  static const String tableAppointments = 'appointments';
  static const String tablePrescriptions = 'prescriptions';
  static const String tableMedicines = 'medicines';
  static const String tableMedicineBatches = 'medicine_batches';

  // Appointment Status
  static const String appointmentPending = 'pending';
  static const String appointmentConfirmed = 'confirmed';
  static const String appointmentCompleted = 'completed';
  static const String appointmentCancelled = 'cancelled';

  // Medicine Categories
  static const List<String> medicineCategories = [
    'Tablet',
    'Capsule',
    'Syrup',
    'Injection',
    'Cream/Ointment',
    'Drops',
    'Inhaler',
    'Other',
  ];

  // Doctor Specialties
  static const List<String> doctorSpecialties = [
    'General Physician',
    'Cardiologist',
    'Dermatologist',
    'Neurologist',
    'Pediatrician',
    'Orthopedic',
    'Gynecologist',
    'Psychiatrist',
    'ENT Specialist',
    'Ophthalmologist',
    'Dentist',
    'Other',
  ];

  // Time Slots (24-hour format)
  static const List<String> timeSlots = [
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
  ];

  // Validation
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;
  static const int minAge = 1;
  static const int maxAge = 120;

  // Map Configuration
  static const double defaultLatitude = 27.7172; // Kathmandu, Nepal
  static const double defaultLongitude = 85.3240;
  static const double defaultZoom = 13.0;
  static const double searchRadiusKm = 10.0;

  // Expiry Alert Thresholds (in days)
  static const int expiryWarningDays = 30;
  static const int expiryCriticalDays = 7;

  // Pagination
  static const int itemsPerPage = 20;

  // Image Configuration
  static const int maxImageSizeMB = 5;
  static const int imageQuality = 85;
}
