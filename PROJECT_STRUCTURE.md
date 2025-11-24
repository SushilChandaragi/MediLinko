# Medilinko - Project Overview & File Structure

## Quick Start for Team Members

### First Time Setup
1. Open terminal in project folder
2. Run: `flutter pub get`
3. Run: `flutter run`
4. Login with any email/password (6+ chars) and select role

### File Organization

```
MINI PROJECT/
│
├── lib/                                    # Main source code
│   ├── main.dart                          # App entry point - START HERE
│   │
│   ├── core/                              # Shared across app
│   │   ├── theme/
│   │   │   └── app_theme.dart            # Colors, fonts, styles
│   │   ├── constants/
│   │   │   └── app_constants.dart        # App-wide constants
│   │   └── models/                       # Data structures
│   │       ├── user_model.dart           # User data
│   │       ├── doctor_model.dart         # Doctor data
│   │       ├── patient_model.dart        # Patient data
│   │       ├── appointment_model.dart    # Appointment data
│   │       ├── prescription_model.dart   # Prescription data
│   │       └── medicine_model.dart       # Medicine & batch data
│   │
│   └── features/                         # Feature modules
│       │
│       ├── auth/                         # Login & Authentication
│       │   ├── screens/
│       │   │   └── login_screen.dart     # Login page
│       │   └── providers/
│       │       └── auth_provider.dart    # Auth logic
│       │
│       ├── doctor/                       # Doctor features
│       │   ├── screens/
│       │   │   └── doctor_dashboard_screen.dart  # Main doctor screen
│       │   └── widgets/
│       │       └── appointment_card.dart # Reusable appointment card
│       │
│       ├── pharmacist/                   # Pharmacist features
│       │   └── screens/
│       │       └── pharmacist_dashboard_screen.dart  # Main pharmacist screen
│       │
│       └── patient/                      # Patient features
│           └── screens/
│               └── patient_dashboard_screen.dart     # Main patient screen
│
├── assets/                               # Images, icons, logos
│   ├── images/
│   ├── icons/
│   └── logo/
│
├── pubspec.yaml                          # Dependencies & config
├── README.md                             # Main documentation
├── BACKEND_GUIDE.md                      # Backend development guide
└── PROJECT_STRUCTURE.md                  # This file
```

## Where to Add New Features

### Adding Doctor Features

**Location:** `lib/features/doctor/`

**Examples:**
- Patient profile details → Create `screens/patient_profile_screen.dart`
- Prescription form → Create `screens/create_prescription_screen.dart`
- Appointment details → Create `screens/appointment_details_screen.dart`

**How to add:**
1. Create new screen file in `screens/` folder
2. Import in `doctor_dashboard_screen.dart`
3. Add navigation (e.g., `Navigator.push()`)

### Adding Pharmacist Features

**Location:** `lib/features/pharmacist/`

**Examples:**
- Add medicine batch → Create `screens/add_batch_screen.dart`
- Batch details → Create `screens/batch_details_screen.dart`
- Sales report → Create `screens/sales_report_screen.dart`

**How to add:**
1. Create screen in `screens/` folder
2. Navigate from dashboard or add to bottom navigation

### Adding Patient Features

**Location:** `lib/features/patient/`

**Examples:**
- Doctor details with map → Create `screens/doctor_details_screen.dart`
- Book appointment → Create `screens/book_appointment_screen.dart`
- View prescription → Create `screens/prescription_details_screen.dart`
- Profile edit → Create `screens/edit_profile_screen.dart`

**How to add:**
1. Create screen in `screens/` folder
2. Add navigation from existing tabs

### Adding Shared Components

**Location:** `lib/core/`

**Examples:**
- Custom button → Create `widgets/custom_button.dart`
- Loading indicator → Create `widgets/loading_widget.dart`
- New data model → Add to `models/` folder
- Utility function → Add to `utils/` folder

## Key Files Explained

### 1. `main.dart`
- App entry point
- Sets up theme and initial route
- Configures providers

### 2. `app_theme.dart`
- Defines all colors, fonts, button styles
- **Modify this** to change app appearance
- Healthcare-themed colors already set

### 3. `app_constants.dart`
- App name, routes, database config
- **Add new constants here** (e.g., API URLs)

### 4. Models (in `core/models/`)
- Data structures for app
- **User model** - Common to all roles
- **Doctor/Patient/Pharmacist** - Role-specific data
- **Appointment/Prescription/Medicine** - Feature data

### 5. Dashboard Screens
- **Doctor Dashboard** - 3 tabs: Today's, Upcoming, Patients
- **Pharmacist Dashboard** - 3 tabs: Inventory, Expiry Alerts, Search
- **Patient Dashboard** - 4 tabs: Home, Doctors, Prescriptions, Appointments

## Common Tasks

### Change App Colors
Edit `lib/core/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF2E7D82); // Change this
```

### Add New Screen
1. Create file: `lib/features/[role]/screens/new_screen.dart`
2. Basic template:
```dart
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      body: Center(child: Text('Content here')),
    );
  }
}
```

### Navigate to New Screen
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);
```

### Add Bottom Navigation Tab
Edit respective dashboard screen and add to:
- `items:` list in `BottomNavigationBar`
- `children:` list in `IndexedStack`

## Current Features Implemented

### ✅ Completed
- [x] Login system with role selection
- [x] Doctor dashboard with appointments
- [x] Pharmacist inventory management
- [x] Patient dashboard with all tabs
- [x] Professional UI with healthcare theme
- [x] Mock data for demonstration
- [x] Responsive layouts

### 🚧 To Be Implemented (Add these!)
- [ ] Actual database integration (SQLite)
- [ ] Google Maps for doctor location
- [ ] Appointment booking form
- [ ] Prescription creation form
- [ ] Medicine search functionality
- [ ] Profile edit screens
- [ ] Image picker for prescriptions
- [ ] Notifications
- [ ] Backend API integration

## Development Workflow

### For Team Members

1. **Choose a feature** from "To Be Implemented" list
2. **Create the screen** in appropriate folder
3. **Add mock data** if needed (like in existing screens)
4. **Test** on emulator/device
5. **Update README** if adding major feature

### Git Workflow (if using version control)
```bash
git checkout -b feature/your-feature-name
# Make changes
git add .
git commit -m "Add: your feature description"
git push origin feature/your-feature-name
# Create pull request
```

## Testing

### Run App
```bash
flutter run
```

### Hot Reload
Press `r` in terminal while app is running

### Hot Restart
Press `R` in terminal

### Check for Errors
```bash
flutter analyze
```

## Important Notes

### Current Limitations
- No real backend - uses mock data
- No database - data doesn't persist
- Google Maps not configured
- Image upload not functional

### These Need Backend
- User registration/login
- Saving appointments
- Storing prescriptions
- Medicine inventory persistence
- Real-time updates

### These Can Work Without Backend
- UI development
- Navigation flow
- Screen layouts
- Theme customization
- Widget development

## Next Steps for Team

### Phase 1: Frontend (Current)
1. Complete all UI screens
2. Refine layouts and design
3. Add missing forms
4. Test user flow

### Phase 2: Local Storage
1. Set up SQLite database
2. Create database helper
3. Save data locally
4. Test CRUD operations

### Phase 3: Backend Integration
1. Follow BACKEND_GUIDE.md
2. Create API service layer
3. Replace mock data with API calls
4. Test end-to-end flow

### Phase 4: Advanced Features
1. Google Maps integration
2. Push notifications
3. Image upload
4. Payment gateway
5. Chat feature

## Getting Help

### Common Issues

**"Package not found" errors**
```bash
flutter pub get
```

**App not running**
```bash
flutter clean
flutter pub get
flutter run
```

**Hot reload not working**
- Press `R` for full restart
- Or stop and run again

### Resources
- Flutter Documentation: https://flutter.dev/docs
- Stack Overflow: Tag your questions with `flutter`
- YouTube: Search for specific Flutter tutorials

## Team Collaboration Tips

1. **Communicate** - Discuss features before implementing
2. **Follow structure** - Keep files in right folders
3. **Comment your code** - Help others understand
4. **Test thoroughly** - Check on different screen sizes
5. **Ask questions** - Better to ask than assume

## Final Checklist Before Submission

- [ ] All screens implemented
- [ ] App runs without errors
- [ ] Tested on Android and/or iOS
- [ ] README is updated
- [ ] Code is commented
- [ ] Demo data works properly
- [ ] UI looks professional
- [ ] Navigation flows smoothly

---

**Remember:** This is a group project. Help each other, review code together, and build something great! 🚀

**Good luck!** 💙
