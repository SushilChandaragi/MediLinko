# 🚀 Quick Setup Guide for Teammates

## Prerequisites
- Install Flutter SDK: https://flutter.dev/docs/get-started/install
- Install Git: https://git-scm.com/downloads
- Install Chrome browser (for web testing)

## Setup Commands (Copy & Paste)

### 1️⃣ Clone the Project
```bash
git clone <your-github-repo-url>
cd MINI PROJECT
```

### 2️⃣ Install Dependencies
```bash
flutter pub get
```

### 3️⃣ Run the App in Chrome
```bash
flutter run -d chrome
```

**That's it!** 🎉 The app will open in your Chrome browser.

---

## Alternative: Run on Windows Desktop
```bash
flutter run -d windows
```

## Alternative: Run on Android Emulator
```bash
flutter run
```
(Make sure Android emulator is running first)

---

## 🔑 Test Login Credentials

Use **any email and password** (password must be 6+ characters):
- Email: `test@example.com`
- Password: `123456`

Then select your role:
- 👨‍⚕️ **Doctor** - See appointments, patient list
- 💊 **Pharmacist** - Manage medicine inventory
- 🏥 **Patient** - Search doctors, view prescriptions

---

## ⚡ Hot Reload

While app is running, press:
- **`r`** - Hot reload (see changes instantly)
- **`R`** - Hot restart (restart app)
- **`q`** - Quit

---

## 🐛 Common Issues

### Error: "Flutter not found"
**Solution:** Add Flutter to PATH or restart your terminal

### Error: "No devices found"
**Solution:** Run `flutter devices` to see available options

### Error: "Pub get failed"
**Solution:** Check your internet connection and run `flutter pub get` again

---

## 📱 Quick Commands Reference

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install dependencies |
| `flutter run -d chrome` | Run on Chrome |
| `flutter run -d windows` | Run on Windows |
| `flutter doctor` | Check Flutter setup |
| `flutter devices` | List available devices |
| `flutter clean` | Clean build files |

---

## 🎯 Ready to Develop?

After the app is running, check these files:
- **README.md** - Complete project documentation
- **PROJECT_STRUCTURE.md** - Where to add your code
- **FEATURES_CHECKLIST.md** - See what needs to be built
- **INDEX.md** - Find everything easily

---

## 💡 Pro Tips

1. **Keep terminal open** - Don't close it while app is running
2. **Use hot reload** - Press `r` to see changes without restarting
3. **Check TROUBLESHOOTING.md** - If you face any issues
4. **Read PROJECT_STRUCTURE.md** - Before adding new features

---

**Need help?** Check **TROUBLESHOOTING.md** or ask the team! 🤝
