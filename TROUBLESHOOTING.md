# Troubleshooting Guide - Medilinko

Common issues and their solutions.

## 🔴 Installation & Setup Issues

### Issue: "flutter command not found"

**Cause:** Flutter not in system PATH

**Solution:**
```bash
# Windows
# Add to PATH: C:\src\flutter\bin

# Mac/Linux
export PATH="$PATH:`pwd`/flutter/bin"
```

Then restart terminal and run:
```bash
flutter doctor
```

---

### Issue: Package errors after opening project

**Error Message:**
```
Target of URI doesn't exist: 'package:flutter/material.dart'
```

**Solution:**
```bash
flutter pub get
```

This downloads all dependencies. Always run this first!

---

### Issue: "Android license not accepted"

**Error from `flutter doctor`:**
```
Android licenses not accepted
```

**Solution:**
```bash
flutter doctor --android-licenses
```

Press 'y' to accept all licenses.

---

### Issue: Xcode not found (Mac only)

**Solution:**
```bash
xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

---

## 🟡 Running the App

### Issue: No devices found

**Error:**
```
No supported devices connected
```

**Solution:**

**For Android Emulator:**
1. Open Android Studio
2. Tools → Device Manager
3. Create or start a virtual device

**For Physical Android Device:**
1. Enable Developer Options
2. Enable USB Debugging
3. Connect via USB
4. Accept debugging prompt on phone

**Check devices:**
```bash
flutter devices
```

---

### Issue: Gradle build failed

**Error:**
```
FAILURE: Build failed with an exception
```

**Solution:**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

If still failing, check `android/build.gradle` for correct SDK versions.

---

### Issue: CocoaPods not installed (iOS/Mac)

**Error:**
```
CocoaPods not installed
```

**Solution:**
```bash
sudo gem install cocoapods
pod setup
cd ios
pod install
cd ..
flutter run
```

---

### Issue: App stuck on white screen

**Solution:**
1. Hot restart: Press `R` in terminal
2. Stop and run again: `Ctrl+C` then `flutter run`
3. Clean build:
```bash
flutter clean
flutter pub get
flutter run
```

---

## 🟢 Development Issues

### Issue: Hot reload not working

**Symptoms:** Changes don't appear after saving

**Solution:**
1. Press `r` in terminal for hot reload
2. Press `R` for hot restart
3. If still not working, stop app and run again

---

### Issue: "Undefined name" or "Undefined class"

**Error Example:**
```
Undefined class 'Widget'
```

**Cause:** Missing import statement

**Solution:**
Add import at top of file:
```dart
import 'package:flutter/material.dart';
```

---

### Issue: "setState() called after dispose()"

**Error:**
```
setState() called after dispose()
```

**Solution:**
Check if widget is mounted before setState:
```dart
if (mounted) {
  setState(() {
    // your code
  });
}
```

---

### Issue: "RenderFlex overflowed"

**Error:**
```
A RenderFlex overflowed by X pixels
```

**Solution:**
Wrap in `SingleChildScrollView`:
```dart
SingleChildScrollView(
  child: Column(
    children: [
      // your widgets
    ],
  ),
)
```

---

### Issue: Images not showing

**Solution:**

1. Check path in pubspec.yaml:
```yaml
flutter:
  assets:
    - assets/images/
```

2. Run:
```bash
flutter pub get
```

3. Use correct path:
```dart
Image.asset('assets/images/logo.png')
```

---

### Issue: "The argument type 'String?' can't be assigned"

**Error:** Null safety issue

**Solution:**
Add null check:
```dart
// Before
Text(someVariable)

// After
Text(someVariable ?? 'Default')
// or
Text(someVariable!)  // if sure it's not null
```

---

## 🔵 Navigation Issues

### Issue: Black screen after navigation

**Solution:**
Use MaterialPageRoute:
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NewScreen(),
  ),
);
```

---

### Issue: Can't go back

**Solution:**
Don't use `pushReplacement` unless you want to replace current screen:
```dart
// Use this to go back
Navigator.push(context, ...)

// Not this (unless intentional)
Navigator.pushReplacement(context, ...)
```

---

## 🟣 Provider Issues

### Issue: "Could not find the correct Provider"

**Error:**
```
Error: Could not find the correct Provider<AuthProvider>
```

**Solution:**
Make sure Provider is above the widget in tree:
```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
  ],
  child: MaterialApp(...)
)
```

---

### Issue: Provider not updating UI

**Solution:**
1. Extend `ChangeNotifier`
2. Call `notifyListeners()` after state change
3. Use `Consumer` or `Provider.of` with `listen: true`

---

## 🟤 Database Issues

### Issue: Database not persisting data

**Check:**
1. Database path correct
2. Await async operations
3. Close database properly

**Example:**
```dart
await db.insert('table', data);  // Don't forget await!
```

---

## ⚪ Build Issues

### Issue: APK build fails

**Error:**
```
BUILD FAILED in Xs
```

**Solution:**
1. Check `android/app/build.gradle`:
```gradle
minSdkVersion 21  // Should be at least 21
compileSdkVersion 33
targetSdkVersion 33
```

2. Clean and rebuild:
```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter build apk
```

---

### Issue: App size too large

**Solution:**
```bash
# Build with code shrinking
flutter build apk --split-per-abi

# This creates 3 APKs (smaller):
# app-armeabi-v7a-release.apk
# app-arm64-v8a-release.apk  
# app-x86_64-release.apk
```

---

## 🔶 Performance Issues

### Issue: App is slow/laggy

**Solutions:**

1. **Use const constructors:**
```dart
const Text('Hello')  // Instead of Text('Hello')
```

2. **Avoid rebuilding entire tree:**
```dart
// Use Consumer at specific widget
Consumer<AuthProvider>(
  builder: (context, auth, child) => Text(auth.name),
)
```

3. **Optimize images:**
- Use appropriate sizes
- Use cached_network_image for web images

4. **Use ListView.builder for long lists:**
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemWidget(items[index]),
)
```

---

## 🔷 Map Issues

### Issue: Google Maps not showing

**Solutions:**

1. **Check API key is added:**

Android: `android/app/src/main/AndroidManifest.xml`
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_KEY_HERE"/>
```

iOS: `ios/Runner/AppDelegate.swift`
```swift
GMSServices.provideAPIKey("YOUR_KEY_HERE")
```

2. **Enable APIs in Google Console:**
- Maps SDK for Android
- Maps SDK for iOS
- Geocoding API

3. **Check permissions:**

Android: `android/app/src/main/AndroidManifest.xml`
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```

iOS: `ios/Runner/Info.plist`
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs location access</string>
```

---

## 🔸 Common Dart Errors

### Issue: "The named parameter 'X' isn't defined"

**Solution:**
Check constructor for available parameters:
```dart
// Wrong
MyWidget(unknownParam: value)

// Right (check widget definition)
MyWidget(correctParam: value)
```

---

### Issue: "Expected to find ';'"

**Cause:** Missing semicolon or bracket

**Solution:**
Check previous lines for:
- Missing semicolon `;`
- Unclosed brackets `()`, `[]`, `{}`
- Unclosed strings `''`, `""`

---

### Issue: "The method 'X' isn't defined"

**Solutions:**
1. Check spelling
2. Check import statements
3. Check if method exists in that class

---

## 📱 Device-Specific Issues

### Issue: Works on emulator, not on real device

**Check:**
1. Debug mode vs Release mode
2. Permissions granted on device
3. Internet connectivity
4. Storage permissions

---

### Issue: Different UI on different devices

**Solution:**
Use responsive design:
```dart
MediaQuery.of(context).size.width
// Adjust layout based on width
```

---

## 🆘 When Nothing Works

### Nuclear Option (Last Resort)

```bash
# Delete everything and start fresh
flutter clean
rm -rf .dart_tool
rm pubspec.lock
flutter pub get

# Android specific
cd android
./gradlew clean
rm -rf .gradle
cd ..

# iOS specific (Mac only)
cd ios
rm -rf Pods
rm Podfile.lock
pod install
cd ..

# Run again
flutter run
```

---

## 🔍 Debugging Tips

### 1. Read the Error Message
Most errors tell you exactly what's wrong!

### 2. Check the Line Number
Error messages show line number where issue occurs

### 3. Use print() for debugging
```dart
print('Debug: Value is $value');
```

### 4. Use Flutter DevTools
```bash
flutter run
# Then open DevTools from browser link shown
```

### 5. Check Flutter Doctor
```bash
flutter doctor -v
```
Shows detailed info about your setup

---

## 📚 Useful Commands Reference

```bash
# Check Flutter installation
flutter doctor
flutter doctor -v

# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run app
flutter run

# Build APK
flutter build apk

# Build for release
flutter build apk --release

# Check devices
flutter devices

# Flutter version
flutter --version

# Upgrade Flutter
flutter upgrade

# Analyze code
flutter analyze

# Format code
flutter format lib/
```

---

## 🔗 Helpful Resources

- **Flutter Docs:** https://flutter.dev/docs
- **Stack Overflow:** https://stackoverflow.com/questions/tagged/flutter
- **Flutter Community:** https://flutter.dev/community
- **Pub.dev:** https://pub.dev (for packages)
- **Flutter YouTube:** https://www.youtube.com/c/flutterdev

---

## 💬 Getting Help

1. **Read error message carefully**
2. **Google the exact error message**
3. **Check Stack Overflow**
4. **Ask team member**
5. **Check official documentation**

### How to Ask for Help

Good question format:
```
Problem: [Describe what's wrong]
Expected: [What should happen]
Actual: [What actually happens]
Error: [Paste error message]
Code: [Share relevant code]
Tried: [What you've tried]
```

---

## ✅ Prevention Tips

1. **Always run `flutter pub get` after changing pubspec.yaml**
2. **Save files before hot reload**
3. **Use version control (Git)**
4. **Test frequently**
5. **Keep Flutter updated**
6. **Read error messages carefully**
7. **Use const constructors when possible**
8. **Don't ignore warnings**

---

**Remember: Every developer faces these issues. You're not alone! 💪**

**Keep calm and debug! 🐛** 

*Most issues have simple solutions. Take a break, read the error carefully, and try again.* ☕
