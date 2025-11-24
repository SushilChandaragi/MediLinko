# Medilinko - Stay Linked and Stay Healthy

A comprehensive healthcare Flutter app connecting Doctors, Pharmacists, and Patients in one platform.

## Features

### For Patients
- **Doctor Search & Discovery**: Search doctors by specialty, view ratings, timing, and location on map
- **Appointment Booking**: Schedule appointments with preferred doctors
- **Prescription Management**: Save and view prescriptions (text or image-based)
- **Medicine Search**: Find available medicines across pharmacies
- **Profile Management**: Store personal health information, allergies, chronic diseases

### For Doctors
- **Dashboard**: View today's and upcoming appointments
- **Patient Management**: Access patient profiles and medical history
- **Prescription Creation**: Create prescriptions by typing or uploading images
- **Appointment Tracking**: Manage appointment status and patient treatments

### For Pharmacists
- **Medicine Inventory**: Manage medicine batches with quantity tracking
- **Batch Management**: Store medicines with manufacturing and expiry dates
- **Expiry Alerts**: Automatic alerts for medicines nearing expiry (30 days warning, 7 days critical)
- **Medicine Lookup**: Quick search for medicine availability and stock levels

## Tech Stack

- **Framework**: Flutter 3.0+
- **State Management**: Provider
- **Navigation**: Go Router
- **Local Database**: SQLite (via sqflite)
- **Maps**: Google Maps Flutter
- **UI**: Material Design 3 with custom healthcare theme

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── core/
│   ├── theme/
│   │   └── app_theme.dart            # App-wide theme configuration
│   ├── constants/
│   │   └── app_constants.dart        # Constants and configuration
│   └── models/                       # Data models
│       ├── user_model.dart
│       ├── doctor_model.dart
│       ├── patient_model.dart
│       ├── appointment_model.dart
│       ├── prescription_model.dart
│       └── medicine_model.dart
├── features/
│   ├── auth/                         # Authentication
│   │   ├── screens/
│   │   │   └── login_screen.dart
│   │   └── providers/
│   │       └── auth_provider.dart
│   ├── doctor/                       # Doctor features
│   │   ├── screens/
│   │   │   └── doctor_dashboard_screen.dart
│   │   └── widgets/
│   │       └── appointment_card.dart
│   ├── pharmacist/                   # Pharmacist features
│   │   └── screens/
│   │       └── pharmacist_dashboard_screen.dart
│   └── patient/                      # Patient features
│       └── screens/
│           └── patient_dashboard_screen.dart
└── assets/
    ├── images/
    ├── icons/
    └── logo/
```

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Android Emulator / iOS Simulator / Physical Device

### Installation Steps

1. **Clone/Extract the Project**
   ```bash
   cd "MINI PROJECT"
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

   Or select your device in VS Code/Android Studio and press F5

### For Team Members

#### Setting Up Development Environment

1. **Install Flutter**: Follow [official Flutter installation guide](https://flutter.dev/docs/get-started/install)
   
2. **Verify Installation**:
   ```bash
   flutter doctor
   ```
   Fix any issues reported

3. **IDE Setup**:
   - **VS Code**: Install Flutter and Dart extensions
   - **Android Studio**: Install Flutter plugin

4. **Get Project Dependencies**:
   ```bash
   flutter pub get
   ```

#### Running the App

- **Debug Mode** (with hot reload):
  ```bash
  flutter run
  ```

- **Release Mode**:
  ```bash
  flutter run --release
  ```

- **Specific Device**:
  ```bash
  flutter devices  # List available devices
  flutter run -d <device-id>
  ```

## Demo Usage

The app currently runs in demo mode with mock authentication:

**Login Credentials**: 
- Email: Any valid email format
- Password: Any password (minimum 6 characters)
- Select Role: Patient / Doctor / Pharmacist

Each role will navigate to its respective dashboard.

## Adding New Features

### Doctor Features
Location: `lib/features/doctor/`

**To add new doctor features**:
1. Create screen in `screens/` folder
2. Add navigation in `doctor_dashboard_screen.dart`
3. Create reusable widgets in `widgets/` folder

Example areas to enhance:
- Patient profile details page
- Prescription creation with image upload
- Appointment details and notes
- Medical history viewer

### Pharmacist Features
Location: `lib/features/pharmacist/`

**To add new pharmacist features**:
1. Create screen in `screens/` folder
2. Add to bottom navigation or as separate screen

Example areas to enhance:
- Add/Edit medicine batch form
- Batch details with QR code
- Sales tracking
- Low stock alerts
- Reports and analytics

### Patient Features
Location: `lib/features/patient/`

**To add new patient features**:
1. Create screen in `screens/` folder
2. Add to existing tabs or create new tab

Example areas to enhance:
- Doctor details with map integration
- Appointment booking calendar
- Prescription image viewer
- Medicine order tracking
- Health records upload
- Chat with doctor

### Shared Components
Location: `lib/core/`

**To add shared functionality**:
- Models: Add to `core/models/`
- Theme: Update `core/theme/app_theme.dart`
- Constants: Add to `core/constants/app_constants.dart`

## Backend Integration Guide

### Current State
- App uses local state management (Provider)
- Mock data for demonstration
- No backend connectivity yet

### Backend Structure Recommendation

#### Technology Options
1. **Node.js + Express + MongoDB**
2. **Firebase (Quick Setup)**
3. **Django + PostgreSQL**
4. **Spring Boot + MySQL**

#### Required API Endpoints

**Authentication**
```
POST /api/auth/register
POST /api/auth/login
POST /api/auth/logout
GET  /api/auth/profile
```

**Doctor APIs**
```
GET    /api/doctors
GET    /api/doctors/:id
POST   /api/doctors
PUT    /api/doctors/:id
GET    /api/doctors/:id/appointments
POST   /api/doctors/:id/prescriptions
GET    /api/doctors/:id/patients
```

**Patient APIs**
```
GET    /api/patients/:id
PUT    /api/patients/:id
GET    /api/patients/:id/appointments
POST   /api/patients/:id/appointments
GET    /api/patients/:id/prescriptions
GET    /api/doctors/search?specialty=&location=
```

**Pharmacist APIs**
```
GET    /api/medicines
POST   /api/medicines
GET    /api/medicines/:id
PUT    /api/medicines/:id
GET    /api/medicine-batches
POST   /api/medicine-batches
GET    /api/medicine-batches/expiring
PUT    /api/medicine-batches/:id
```

**Appointment APIs**
```
GET    /api/appointments
POST   /api/appointments
GET    /api/appointments/:id
PUT    /api/appointments/:id
DELETE /api/appointments/:id
```

**Prescription APIs**
```
GET    /api/prescriptions
POST   /api/prescriptions
GET    /api/prescriptions/:id
POST   /api/prescriptions/upload-image
```

#### Database Schema

**Users Table**
- id (PK)
- email (unique)
- password_hash
- name
- phone
- role (enum: doctor, pharmacist, patient)
- profile_image_url
- created_at
- updated_at

**Doctors Table**
- id (PK)
- user_id (FK to Users)
- specialty
- qualification
- experience_years
- clinic_name
- clinic_address
- latitude
- longitude
- working_hours_start
- working_hours_end
- consultation_fee
- rating
- total_ratings
- bio

**Patients Table**
- id (PK)
- user_id (FK to Users)
- date_of_birth
- gender
- blood_group
- height
- weight
- address
- allergies
- chronic_diseases
- emergency_contact_name
- emergency_contact_phone

**Appointments Table**
- id (PK)
- patient_id (FK)
- doctor_id (FK)
- appointment_date
- time_slot
- status (enum: pending, confirmed, completed, cancelled)
- symptoms
- diagnosis
- notes
- created_at
- updated_at

**Prescriptions Table**
- id (PK)
- patient_id (FK)
- doctor_id (FK)
- appointment_id (FK, nullable)
- prescription_date
- diagnosis
- medicines (JSON or separate table)
- additional_notes
- prescription_image_url
- created_at

**Medicines Table**
- id (PK)
- name
- generic_name
- category
- manufacturer
- description
- price
- requires_prescription (boolean)
- created_at

**Medicine_Batches Table**
- id (PK)
- medicine_id (FK)
- pharmacist_id (FK)
- batch_number (unique)
- quantity
- remaining_quantity
- manufacturing_date
- expiry_date
- purchase_price
- selling_price
- created_at
- updated_at

#### Integration Steps

1. **Setup HTTP Client** (Already included: `http` and `dio` packages)

2. **Create API Service Layer**
   ```
   lib/core/services/
   ├── api_service.dart          # Base API client
   ├── auth_service.dart         # Authentication APIs
   ├── doctor_service.dart       # Doctor APIs
   ├── patient_service.dart      # Patient APIs
   └── pharmacist_service.dart   # Pharmacist APIs
   ```

3. **Update Providers**
   - Replace mock data with API calls
   - Add loading states
   - Handle errors

4. **Add Environment Configuration**
   ```dart
   // lib/core/config/environment.dart
   class Environment {
     static const String apiBaseUrl = 'YOUR_API_URL';
     static const String googleMapsApiKey = 'YOUR_MAPS_KEY';
   }
   ```

5. **Implement Authentication Token Storage**
   - Use shared_preferences to store JWT token
   - Add token to all API requests
   - Implement token refresh logic

## Google Maps Setup (For Patient Features)

1. **Get API Key** from [Google Cloud Console](https://console.cloud.google.com/)

2. **Android**: Add to `android/app/src/main/AndroidManifest.xml`
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY"/>
   ```

3. **iOS**: Add to `ios/Runner/AppDelegate.swift`
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY")
   ```

## Building for Production

### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Troubleshooting

**Package errors**: Run `flutter pub get`

**Build errors**: 
```bash
flutter clean
flutter pub get
flutter run
```

**Hot reload not working**: Press `r` in terminal or restart app with `R`

## Color Theme

- **Primary (Teal)**: #2E7D82 - Trust & health
- **Secondary (Green)**: #4CAF50 - Wellness
- **Accent (Cyan)**: #00BCD4 - Medical
- **Doctor Theme**: #1976D2 (Blue)
- **Pharmacist Theme**: #7B1FA2 (Purple)
- **Patient Theme**: #2E7D82 (Teal)

## Contributing

When adding features:
1. Follow existing project structure
2. Use provided theme colors
3. Add comments for complex logic
4. Test on both Android and iOS if possible
5. Update this README if adding major features

## Team Workflow

1. **Feature Development**: Create features in respective folders
2. **Testing**: Test on emulator/device before committing
3. **Code Review**: Review each other's code
4. **Integration**: Integrate backend when ready
5. **Documentation**: Update README and add code comments

## Future Enhancements

- [ ] Google Maps integration for doctor location
- [ ] Push notifications for appointments
- [ ] Chat between doctor and patient
- [ ] Video consultation
- [ ] Medicine order and delivery
- [ ] Payment gateway integration
- [ ] Health records upload (PDF, images)
- [ ] Emergency services
- [ ] Medicine reminder notifications
- [ ] Multi-language support

## License

This project is for educational purposes.

## Contact

For queries related to this project, contact your team lead or project supervisor.

---

**Medilinko - Connecting healthcare, one click at a time.** 🏥💙
