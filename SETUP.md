# 🚀 Medilinko Setup Guide

Quick setup instructions for teammates.

## Prerequisites

Install these first:
- **Flutter SDK**: https://flutter.dev/docs/get-started/install
- **Git**: https://git-scm.com/downloads
- **Chrome** or **Android Studio** (for running the app)

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/SushilChandaragi/MediLinko.git
cd MediLinko
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App

**Option A - Chrome (Recommended for quick testing):**
```bash
flutter run -d chrome
```

**Option B - Windows Desktop:**
```bash
flutter run -d windows
```

**Option C - Android Emulator:**
```bash
flutter run
```
(Make sure emulator is running first)

## 🔑 Test Login

The app currently uses **demo authentication**.

**Login with:**
- Email: `test@example.com` (or any email)
- Password: `123456` (or any 6+ characters)

**Then select a role:**
- 👨‍⚕️ **Doctor** → View appointments & patients
- 💊 **Pharmacist** → Manage medicine inventory  
- 🏥 **Patient** → Search doctors & view prescriptions

## ⚡ Development Tips

### Hot Reload (See changes instantly)
While the app is running, press:
- `r` → Hot reload (faster, preserves state)
- `R` → Hot restart (full restart)
- `q` → Quit

### Check Available Devices
```bash
flutter devices
```

### Clean Build (if errors occur)
```bash
flutter clean
flutter pub get
```

### Check Flutter Setup
```bash
flutter doctor
```

## 📂 Where to Add Code

### For Patient Features
`lib/features/patient/screens/patient_dashboard_screen.dart`

### For Doctor Features
`lib/features/doctor/screens/doctor_dashboard_screen.dart`

### For Pharmacist Features
`lib/features/pharmacist/screens/pharmacist_dashboard_screen.dart`

### Add New Models
`lib/core/models/your_model.dart`

### Change Colors/Theme
`lib/core/theme/app_theme.dart`

## 🐛 Common Issues

### Issue: "Flutter not found"
**Fix:** Add Flutter to PATH or restart terminal after installation

### Issue: "No devices found"
**Fix:** 
```bash
flutter devices  # See available options
flutter run -d chrome  # Force Chrome
```

### Issue: Build errors after cloning
**Fix:**
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

### Issue: Hot reload not working
**Fix:** Press `R` (capital R) for full restart

### Issue: "Waiting for connection..." (stuck)
**Fix:** 
- Close the app window
- Press `q` in terminal
- Run `flutter run -d chrome` again

## 📝 Git Workflow

### Before Making Changes
```bash
git pull origin main  # Get latest code
git checkout -b feature/your-feature-name
```

### After Making Changes
```bash
git add .
git commit -m "Description of changes"
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## 🎯 Quick Commands Reference

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install dependencies |
| `flutter run -d chrome` | Run on Chrome |
| `flutter run -d windows` | Run on Windows |
| `flutter devices` | List devices |
| `flutter doctor` | Check setup |
| `flutter clean` | Clean build files |
| `r` (while running) | Hot reload |
| `R` (while running) | Hot restart |
| `q` (while running) | Quit app |

## 🎓 First Time Setup Checklist

- [ ] Install Flutter SDK
- [ ] Clone repository
- [ ] Run `flutter pub get`
- [ ] Run `flutter doctor` (fix any issues)
- [ ] Run `flutter run -d chrome`
- [ ] Test login with any credentials
- [ ] Try all three roles (Doctor, Pharmacist, Patient)
- [ ] Test hot reload by changing some text
- [ ] Read main [README.md](README.md) for features

## 💡 Pro Tips

1. **Keep terminal open** - Don't close it while developing
2. **Use hot reload** - Press `r` after code changes (super fast!)
3. **Chrome is fastest** - Use Chrome for quick UI testing
4. **Check logs** - Terminal shows errors and print statements
5. **Test all roles** - Logout and login as different roles

## 📱 Building for Production

### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Windows Executable
```bash
flutter build windows --release
```
Output: `build/windows/runner/Release/`

### Web Build
```bash
flutter build web --release
```
Output: `build/web/`

## 🔗 Useful Links

- **Flutter Docs**: https://flutter.dev/docs
- **Flutter Cookbook**: https://flutter.dev/docs/cookbook
- **GitHub Repo**: https://github.com/SushilChandaragi/MediLinko
- **Stack Overflow**: https://stackoverflow.com/questions/tagged/flutter

## ✅ Verify Installation

Run these commands to verify everything works:

```bash
# 1. Check Flutter is installed
flutter --version

# 2. Check for issues
flutter doctor

# 3. See available devices
flutter devices

# 4. Get dependencies
flutter pub get

# 5. Run the app
flutter run -d chrome
```

If all commands work, you're ready to develop! 🎉

---

**Need more details?** Check the main [README.md](README.md)

**Got stuck?** Create an issue on GitHub or ask the team!
