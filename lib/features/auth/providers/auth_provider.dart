import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _currentUser != null;

  // Initialize auth state
  Future<void> initAuth() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool(AppConstants.keyIsLoggedIn) ?? false;

      if (isLoggedIn) {
        final userId = prefs.getString(AppConstants.keyUserId);
        final userName = prefs.getString(AppConstants.keyUserName);
        final userEmail = prefs.getString(AppConstants.keyUserEmail);
        final userRole = prefs.getString(AppConstants.keyUserRole);

        if (userId != null && userName != null && userEmail != null && userRole != null) {
          _currentUser = User(
            id: userId,
            name: userName,
            email: userEmail,
            role: userRole,
            phone: '', // Will be loaded from database
            createdAt: DateTime.now(),
          );
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to initialize auth: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Login method (to be connected with backend)
  Future<bool> login(String email, String password, String role) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

      // Mock authentication for demo purposes
      // In production, this will validate against your backend
      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: _extractNameFromEmail(email),
        role: role,
        phone: '',
        createdAt: DateTime.now(),
      );

      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.keyIsLoggedIn, true);
      await prefs.setString(AppConstants.keyUserId, _currentUser!.id);
      await prefs.setString(AppConstants.keyUserName, _currentUser!.name);
      await prefs.setString(AppConstants.keyUserEmail, _currentUser!.email);
      await prefs.setString(AppConstants.keyUserRole, _currentUser!.role);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Login failed: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout method
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      _currentUser = null;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Logout failed: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Helper method to extract name from email
  String _extractNameFromEmail(String email) {
    return email.split('@')[0].replaceAll('.', ' ').split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
