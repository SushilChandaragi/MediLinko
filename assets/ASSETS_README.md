# Assets Guide for Medilinko

## Required Assets

Place your images, icons, and logos in the appropriate folders:

### Logo (assets/logo/)
- `app_logo.png` - Main app logo (1024x1024px)
- `app_icon.png` - App launcher icon (512x512px)
- `splash_logo.png` - Splash screen logo (512x512px)

### Images (assets/images/)
- `doctor_placeholder.png` - Default doctor profile image
- `patient_placeholder.png` - Default patient profile image
- `medicine_placeholder.png` - Default medicine image
- `empty_appointments.png` - Empty state for appointments
- `empty_prescriptions.png` - Empty state for prescriptions
- `onboarding_1.png` - (Optional) Onboarding screen 1
- `onboarding_2.png` - (Optional) Onboarding screen 2
- `onboarding_3.png` - (Optional) Onboarding screen 3

### Icons (assets/icons/)
- `doctor_icon.png` - Doctor role icon
- `pharmacist_icon.png` - Pharmacist role icon
- `patient_icon.png` - Patient role icon
- `prescription_icon.png` - Prescription icon
- `medicine_icon.png` - Medicine icon
- `appointment_icon.png` - Appointment icon

## Using Assets in Code

### Update pubspec.yaml (already done)
```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/logo/
```

### Use in Flutter Code
```dart
// Display an image
Image.asset(
  'assets/logo/app_logo.png',
  width: 200,
  height: 200,
)

// Use as background
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/doctor_placeholder.png'),
      fit: BoxFit.cover,
    ),
  ),
)
```

## Free Image Resources

- **Icons**: https://www.flaticon.com/
- **Medical Images**: https://unsplash.com/s/photos/medical
- **Illustrations**: https://undraw.co/illustrations
- **App Icons**: https://icon.kitchen/

## Current State

The app uses Material Design icons (built-in) for now.
Add custom images to enhance the visual appeal!

## Note

For demo purposes, the app works without these images.
Add them to make it more professional and polished.
