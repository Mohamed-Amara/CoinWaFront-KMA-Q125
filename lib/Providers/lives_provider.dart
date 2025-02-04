import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';

class LivesProvider with ChangeNotifier {
  int _lives = 4;
  int get lives => _lives;

  Timer? _timer;
  DateTime? _nextLifeRegeneration;
  Duration get timeLeft => _nextLifeRegeneration != null
      ? _nextLifeRegeneration!.difference(DateTime.now())
      : Duration.zero;

  final AuthService _authService = AuthService();

  LivesProvider(BuildContext context) {
    _fetchLives(context);
  }

  Future<void> _fetchLives(BuildContext context) async {
    try {
      final response = await _authService.getUserProfile(context);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['lives'] != null) {
          _lives = responseData['lives'];
        }
        if (responseData['nextLifeRegeneration'] != null) {
          _nextLifeRegeneration = DateTime.parse(responseData['nextLifeRegeneration']);
        }
        notifyListeners();
        _startTimer();
      } else {
        print('Error fetching lives: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching lives: $error');
    }
  }

  Future<void> _updateLives(BuildContext context, int lives) async {
    try {
      final response = await _authService.updateUserProfile(context, {
        'lives': lives,
        'nextLifeRegeneration': _nextLifeRegeneration?.toIso8601String()
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['lives'] != null) {
          _lives = responseData['lives'];
        }
        if (responseData['nextLifeRegeneration'] != null) {
          _nextLifeRegeneration = DateTime.parse(responseData['nextLifeRegeneration']);
        }
        notifyListeners();
        _startTimer();
      } else {
        print('Error updating lives: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating lives: $error');
    }
  }

  void loseLife(BuildContext context) async {
    if (_lives > 0) {
      _lives--;
    
      _nextLifeRegeneration = DateTime.now().add(Duration(seconds: 30)); // Set next life regeneration in 30 seconds

      notifyListeners();
      await _updateLives(context, _lives);
      if (_lives < 4) {
        _startTimer();
      }
    }
  }

  void _startTimer() {
    _stopTimer();
    if (_lives < 4 && _nextLifeRegeneration != null) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_nextLifeRegeneration!.isBefore(DateTime.now())) {
          // Fetch latest lives once regeneration time is reached
          // _fetchLives should be called with context
        }
        notifyListeners();
      });
    }
  }

  Future<void> fetchUserData(BuildContext context) async {
    await _fetchLives(context);
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}
