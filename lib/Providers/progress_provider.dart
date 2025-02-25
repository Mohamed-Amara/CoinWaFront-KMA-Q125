import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'dart:async';
import 'dart:convert';

class ProgressProvider extends ChangeNotifier {
  int _level = 1;
  int _sublevel = 1;
  List<List<int>> _incorrectQuestions = [];

  int get level => _level;
  int get sublevel => _sublevel;
  List<int> get currentLevelIncorrectQuestions =>
      _incorrectQuestions.isNotEmpty && _level - 1 < _incorrectQuestions.length
          ? _incorrectQuestions[_level - 1]
          : [];

  final AuthService _authService = AuthService();

  ProgressProvider(BuildContext context) {
    _fetchProgress(context);
  }

  int get currentLevelInt {
    return _level;
  }

  Future<void> _fetchProgress(BuildContext context) async {
    try {
      final response = await _authService.getUserProfile(context);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['progress']['currentLevel'] != null &&
            responseData['progress']['sublevel'] != null &&
            responseData['progress']['incorrectQuestions'] != null) {
          _level = responseData['progress']['currentLevel'];
          _sublevel = responseData['sublevel'];
          _incorrectQuestions =
              (responseData['progress']['incorrectQuestions'] as List)
                  .map((levelIncorrectQuestions) =>
                      List<int>.from(levelIncorrectQuestions))
                  .toList();
          notifyListeners();
        }
      } else {
        print("Error fetching level: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching level: $error");
    }
  }

  Future<void> _updateProgress(BuildContext context) async {
    try {
      final response = await _authService.updateUserProfile(context, {
        'progress': {
          'currentLevel': _level,
          'sublevel': _sublevel,
          'incorrectQuestions': _incorrectQuestions
        }
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['progress']['currentLevel'] != null &&
            responseData['progress']['sublevel'] != null &&
            responseData['progress']['incorrectQuestions'] != null) {
          _level = responseData['progress']['currentLevel'];
          _sublevel = responseData['sublevel'];
          _incorrectQuestions =
              (responseData['progress']['incorrectQuestions'] as List)
                  .map((levelIncorrectQuestions) =>
                      List<int>.from(levelIncorrectQuestions))
                  .toList();
          notifyListeners();
        }
      } else {
        print('Error updating level: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating level: $error');
    }
  }

  void incrementProgress(BuildContext context) async {
    _sublevel = 1;
    _level++;
    if (_level > _incorrectQuestions.length) {
      _incorrectQuestions.add([]);
    }
    notifyListeners();
    await _updateProgress(context);
  }

  void setSublevel(BuildContext context, int num) async {
    _sublevel = num;
    notifyListeners();
    await _updateProgress(context);
  }

  void resetProgress(BuildContext context) async {
    _level = 1;
    _sublevel = 1;
    _incorrectQuestions = [[]];
    notifyListeners();
    await _updateProgress(context);
  }

  Future<void> fetchUserData(BuildContext context) async {
    await _fetchProgress(context);
  }

  void addIncorrectQuestion(BuildContext context) {
    // Ensure _incorrectQuestions has at least _level elements
    while (_incorrectQuestions.length < _level) {
      _incorrectQuestions.add([]);
    }

    // Check if _sublevel is already present in the sublist for the current level
    bool found = _incorrectQuestions[_level - 1].contains(_sublevel);

    // If _sublevel is not found, add it to the appropriate sublist
    if (!found) {
      _incorrectQuestions[_level - 1].add(_sublevel);
      notifyListeners(); // Notify listeners of the change
      _updateProgress(
          context); // Call method to update progress or perform other actions
    }
  }
}
