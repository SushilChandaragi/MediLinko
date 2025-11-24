# 🚀 Quick Start Guide - Medilinko

## For Team Members - Read This First!

### Step 1: Install Flutter (One Time Setup)

**Windows:**
1. Download Flutter SDK: https://flutter.dev/docs/get-started/install/windows
2. Extract to `C:\src\flutter`
3. Add to PATH: `C:\src\flutter\bin`
4. Run `flutter doctor` in terminal

**Mac:**
1. Download Flutter SDK: https://flutter.dev/docs/get-started/install/macos
2. Extract and add to PATH
3. Run `flutter doctor` in terminal

### Step 2: Install IDE

**Option A: VS Code (Recommended for beginners)**
1. Download: https://code.visualstudio.com/
2. Install extensions:
   - Flutter
   - Dart

**Option B: Android Studio**
1. Download: https://developer.android.com/studio
2. Install Flutter plugin

### Step 3: Setup Emulator

**Android:**
1. Open Android Studio
2. Tools → Device Manager
3. Create Virtual Device
4. Select any phone (e.g., Pixel 6)
5. Download system image
6. Start emulator

**iOS (Mac only):**
1. Install Xcode from App Store
2. Run: `xcode-select --install`
3. Open Simulator app

### Step 4: Run the Project

```bash
# Navigate to project folder
cd "C:\Users\SushilSC\Desktop\MINI PROJECT"

# Install dependencies
flutter pub get

# Check if device is connected
flutter devices

# Run the app
flutter run
```

## Login Credentials (Demo Mode)

- **Email**: anything@email.com
- **Password**: 123456 (or any 6+ character password)
- **Role**: Select Doctor / Pharmacist / Patient

## Project Overview

### What Each Role Can Do

**👨‍⚕️ Doctor Dashboard**
- View today's appointments
- See upcoming appointments
- Access patient list
- (To implement: Create prescriptions, view patient details)

**💊 Pharmacist Dashboard**
- View medicine inventory
- Check expiry alerts
- Search medicines
- (To implement: Add new batches, update stock)

**🏥 Patient Dashboard**
- Search for doctors
- View prescriptions
- Book appointments
- Check appointment history
- (To implement: Map view, profile edit)

## File Structure (Where to Work)

```
lib/
├── features/
│   ├── doctor/          ← Add doctor features here
│   ├── pharmacist/      ← Add pharmacist features here
│   └── patient/         ← Add patient features here
```

## Common Commands

```bash
# Install packages
flutter pub get

# Run app
flutter run

# Hot reload (press 'r' while app is running)
# Hot restart (press 'R' while app is running)

# Clean build
flutter clean
flutter pub get

# Check for issues
flutter doctor

# Build APK
flutter build apk
```

## Making Changes

### Example: Add a new doctor screen

1. Create file: `lib/features/doctor/screens/patient_profile_screen.dart`

2. Add this code:
```dart
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient Profile')),
      body: Center(
        child: Text('Patient details will go here'),
      ),
    );
  }
}
```

3. Navigate to it from dashboard:
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PatientProfileScreen(),
  ),
);
```

## Common Issues & Fixes

### Issue: "Package not found"
```bash
flutter pub get
```

### Issue: "Gradle build failed" (Android)
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Issue: App not updating
- Press `R` in terminal for full restart
- Or stop app and run again

### Issue: "flutter command not found"
- Flutter not in PATH
- Restart terminal after adding to PATH

## Development Tips

1. **Save often** - Flutter has hot reload, but save before testing
2. **Use hot reload** - Press `r` in terminal to see changes instantly
3. **Check console** - Errors appear in terminal where you ran `flutter run`
4. **Comment your code** - Help your teammates understand
5. **Test on real device** - Enable USB debugging on Android phone

## Testing Checklist

Before saying "done":
- [ ] App runs without errors
- [ ] UI looks good on different screen sizes
- [ ] Navigation works properly
- [ ] Back button works correctly
- [ ] Mock data displays properly

## Working as a Team

### Divide Work Example:

**Person 1: Doctor Features**
- Patient profile screen
- Prescription creation form
- Appointment details

**Person 2: Pharmacist Features**
- Add medicine batch form
- Batch details screen
- Expiry alert notifications

**Person 3: Patient Features**
- Doctor details with map
- Appointment booking form
- Profile edit screen

**Person 4: Backend (Optional)**
- Follow BACKEND_GUIDE.md
- Create APIs
- Set up database

## Need Help?

1. **Read the error message** - Usually tells you what's wrong
2. **Check README.md** - Detailed documentation
3. **Google the error** - Add "flutter" to your search
4. **Ask teammate** - Someone might have solved it
5. **Stack Overflow** - Search with "flutter" tag

## Important Files

- `README.md` - Full documentation
- `BACKEND_GUIDE.md` - For backend development
- `PROJECT_STRUCTURE.md` - Detailed file structure
- `pubspec.yaml` - Dependencies and config

## Next Steps

1. ✅ Get app running (you're here!)
2. Explore existing screens
3. Pick a feature to implement
4. Create the screen
5. Test thoroughly
6. Move to next feature

## Quick Reference

### Import Statements You'll Use Often
```dart
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
```

### Common Widgets
```dart
// Button
ElevatedButton(
  onPressed: () {},
  child: Text('Click Me'),
)

// Text Input
TextField(
  decoration: InputDecoration(
    labelText: 'Enter text',
  ),
)

// Show message
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Message')),
);
```

## Demo Video Checklist

When recording demo:
1. Show login with all 3 roles
2. Navigate through each dashboard
3. Show all tabs/sections
4. Highlight key features
5. Mention future enhancements

---

## 🎯 Your Goal

Build a **professional, working healthcare app** that:
- Has clean, intuitive UI
- Works smoothly on mobile
- Demonstrates all features
- Shows your teamwork

**You can do this! Start with getting the app running, then add features one by one.** 💪

---

**Questions? Check README.md or ask your team!** 

**Good luck with your project!** 🚀💙
