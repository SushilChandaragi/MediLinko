# 🏥 Medilinko - Healthcare App

> **Stay Linked and Stay Healthy** - Connecting Doctors, Pharmacists, and Patients

## 📱 About

Medilinko is a Flutter healthcare application connecting three key roles:
- **👨‍⚕️ Doctors** - Manage appointments and patients
- **💊 Pharmacists** - Handle medicine inventory
- **🏥 Patients** - Find doctors and manage health

## ✨ Features

### For Patients
- Search doctors by specialty with ratings
- Book appointments
- View and save prescriptions
- Track medical history

### For Doctors
- View today's and upcoming appointments
- Manage patient list
- Track appointment status

### For Pharmacists
- Manage medicine inventory in batches
- Get expiry alerts (30 days warning, 7 days critical)
- Search medicine availability

## 🚀 Quick Start

See **[SETUP.md](SETUP.md)** for installation instructions.

**TL;DR:**
```bash
git clone https://github.com/SushilChandaragi/MediLinko.git
cd MediLinko
flutter pub get
flutter run -d chrome
```

**Test Login:** Any email + password (6+ chars), then select a role.

## 🛠️ Tech Stack

- **Flutter** 3.0+ (Dart SDK)
- **Provider** - State management
- **Google Maps** - Location services
- **SQLite** - Local database
- **Material Design 3** - UI framework

## 📁 Project Structure

```
lib/
├── main.dart
├── core/
│   ├── theme/app_theme.dart          # Colors & styling
│   ├── constants/app_constants.dart  # App constants
│   └── models/                       # Data models
│       ├── user_model.dart
│       ├── doctor_model.dart
│       ├── patient_model.dart
│       ├── appointment_model.dart
│       ├── prescription_model.dart
│       └── medicine_model.dart
└── features/
    ├── auth/
    │   ├── providers/auth_provider.dart
    │   └── screens/login_screen.dart
    ├── doctor/
    │   ├── screens/doctor_dashboard_screen.dart
    │   └── widgets/appointment_card.dart
    ├── pharmacist/
    │   └── screens/pharmacist_dashboard_screen.dart
    └── patient/
        └── screens/patient_dashboard_screen.dart
```

## 🎨 Color Theme

- **Primary**: Teal `#2E7D82` (Healthcare calm)
- **Secondary**: Green `#4CAF50` (Health & vitality)
- **Accent**: Cyan `#00BCD4`
- **Role Colors**: Blue (Doctor), Purple (Pharmacist), Teal (Patient)

## 💻 Development

### Adding New Features

**1. Create a new screen:**
```dart
// lib/features/[role]/screens/new_screen.dart
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Feature')),
      body: Center(child: Text('Coming soon')),
    );
  }
}
```

**2. Add route in constants:**
```dart
// lib/core/constants/app_constants.dart
static const String newFeatureRoute = '/new-feature';
```

**3. Navigate to it:**
```dart
Navigator.pushNamed(context, AppConstants.newFeatureRoute);
```

### Changing Colors

Edit `lib/core/theme/app_theme.dart`:
```dart
static const primaryColor = Color(0xFF2E7D82);  // Change hex code
```

### Testing
- **Hot Reload**: Press `r` while app is running
- **Hot Restart**: Press `R`
- **Login**: Any email + password (6+ chars)

## 🔧 Backend Integration

Currently uses **mock data**. To connect a real backend:

### 1. Create API Service
```dart
// lib/core/services/api_service.dart
class ApiService {
  static const baseUrl = 'https://your-api.com';
  
  Future<List<Doctor>> getDoctors() async {
    final response = await http.get('$baseUrl/doctors');
    // Parse and return
  }
}
```

### 2. Update Providers
Replace mock data in providers with API calls.

### 3. Recommended Backend Stack
- **Node.js + Express + MongoDB** (Easiest)
- **Python + Django + PostgreSQL**
- **Spring Boot + MySQL**

### API Endpoints Needed
```
POST   /auth/login
POST   /auth/register
GET    /doctors
GET    /doctors/:id
POST   /appointments
GET    /appointments/patient/:id
GET    /appointments/doctor/:id
POST   /prescriptions
GET    /prescriptions/patient/:id
GET    /medicines
POST   /medicines/batch
```

## 📊 Database Schema

### Users Table
- id, email, password_hash, name, role, phone, profile_image, created_at

### Doctors Table
- id, user_id (FK), specialty, qualification, experience_years, clinic_name, clinic_address, latitude, longitude, working_hours_start, working_hours_end, consultation_fee, rating, bio

### Patients Table
- id, user_id (FK), date_of_birth, gender, blood_group, height, weight, allergies, chronic_diseases, emergency_contact

### Appointments Table
- id, patient_id (FK), doctor_id (FK), appointment_date, time_slot, status, symptoms, diagnosis, notes

### Prescriptions Table
- id, patient_id (FK), doctor_id (FK), appointment_id (FK), diagnosis, medicines (JSON), prescription_image

### Medicines Table
- id, name, generic_name, category, manufacturer, price, requires_prescription

### Medicine Batches Table
- id, medicine_id (FK), pharmacist_id (FK), batch_number, quantity, remaining_quantity, manufacturing_date, expiry_date

## 🐛 Troubleshooting

### "Flutter not found"
Install Flutter: https://flutter.dev/docs/get-started/install

### "No devices found"
```bash
flutter devices  # Check available devices
flutter run -d chrome  # Use Chrome
```

### Build errors after git clone
```bash
flutter clean
flutter pub get
```

### Hot reload not working
Press `R` (capital R) for full restart

## 📝 To-Do List

### Phase 1 (Essential)
- [ ] Patient profile edit screen
- [ ] Doctor appointment details screen
- [ ] Book appointment form
- [ ] Create prescription form
- [ ] Backend API implementation

### Phase 2 (Advanced)
- [ ] Google Maps integration for doctor location
- [ ] Image upload for prescriptions
- [ ] Push notifications for appointments
- [ ] Real-time chat between patient-doctor
- [ ] Payment gateway integration

### Phase 3 (Enhancements)
- [ ] Video consultation
- [ ] Health records export (PDF)
- [ ] Medicine price comparison
- [ ] Pharmacy home delivery
- [ ] Multi-language support

## 👥 Team Collaboration

1. **Clone the repo**
2. **Create feature branch**: `git checkout -b feature/your-feature`
3. **Make changes** and test
4. **Commit**: `git commit -m "Add feature"`
5. **Push**: `git push origin feature/your-feature`
6. **Create Pull Request** on GitHub

## 📄 License

This project is for educational purposes.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📞 Support

- **Issues**: Create a GitHub issue
- **Questions**: Check the code comments
- **Setup Help**: See [SETUP.md](SETUP.md)

---

**Built with ❤️ using Flutter** | [GitHub](https://github.com/SushilChandaragi/MediLinko)
