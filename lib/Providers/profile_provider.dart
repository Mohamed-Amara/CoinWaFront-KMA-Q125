import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/Templates/badges_animation.dart';

class ProfileProvider extends ChangeNotifier {
  String _username = "";
  String _fullname = "";
  int _followingNum = 0;
  int _followerNum = 0;
  String _profilepic = 'assets/defaultguy.png'; // default profile picture
  int _streak = 0;
  List<String> _badges = [];
  String _token = "";

  String get username => _username;
  String get fullname => _fullname;
  int get followingNum => _followingNum;
  int get followerNum => _followerNum;
  String get profilepic => _profilepic;
  int get streak => _streak;
  List<String> get badges => _badges;
  String get token => _token;

  final AuthService _authService = AuthService();
  late Future<void> initialization;

  ProfileProvider(BuildContext context) {
    initialization = _fetchProfilePage(context);
  }

  // Getter for the number of unlocked badges
  int get unlockedBadges => _badges.length;

  Future<void> _fetchToken(BuildContext context) async {
    try {
      final token = await _authService.getToken();
      if (token != null) {
        _token = token;
        notifyListeners();
      } else {
        if (kDebugMode) {
          print("No token found");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error fetching user token: $error");
      }
    }
  }

  Future<void> _fetchProfilePage(BuildContext context) async {
    try {
      final response = await _authService.getUserProfile(context);
      // ignore: use_build_context_synchronously
      _fetchToken(context);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        _setProfileData(responseData);
      } else {
        if (kDebugMode) {
          print('Error fetching profile page: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error fetching profile page: $error");
      }
    }
  }

  void _setProfileData(Map<String, dynamic> responseData) {
    _username = responseData['username'];
    _fullname = responseData['fullname'];
    _followerNum = responseData['followers']['followerAmount'];
    _followingNum = responseData['following']['followingAmount'];
    _profilepic = responseData['profilepic'] ?? 'assets/defaultguy.png';
    _streak = responseData['loginStreak'];
    _badges = List<String>.from(
        responseData['badges'].map((badge) => badge.toString()));
    notifyListeners(); // Notify listeners about the change
  }

  Future<void> updateProfilePicture(
      BuildContext context, String newProfilePic) async {
    try {
      final response = await _authService
          .updateUserProfile(context, {'profilepic': newProfilePic});

      if (response.statusCode == 200) {
        _profilepic = newProfilePic;
        notifyListeners(); // Notify listeners about the change
      } else {
        if (kDebugMode) {
          print('Error updating profile picture: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error updating profile picture: $error");
      }
    }
  }

  Future<void> updateUserBadge(BuildContext context, String badgeName) async {
    try {
      final response = await _authService.updateBadges(
          context, 'assets/Badges/$badgeName.png');

      if (response.statusCode == 200) {
        _badges.add(badgeName);
        notifyListeners(); // Notify listeners about the change

        // Show badge popup
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return BadgePopup(
              badgeImagePath:
                  'assets/Badges/$badgeName.png', // Path to badge image
              onClose: () {
                Navigator.of(context).pop();
              },
            );
          },
        );
      } else {
        if (kDebugMode) {
          print('Error updating user badge: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error updating user badge: $error");
      }
    }
  }

  void clearUserData() {
    _username = "";
    _fullname = "";
    _followingNum = 0;
    _followerNum = 0;
    _profilepic = 'assets/defaultguy.png';
    _streak = 0;
    _badges = [];
    notifyListeners();
  }

  Future<void> fetchUserData(BuildContext context) async {
    await _fetchProfilePage(context);
  }

  void setUserData(Map<String, dynamic> responseData) {
    _setProfileData(responseData);
  }
}
