import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/src/response.dart';

class LeaderProvider extends ChangeNotifier {
  List<int> _coins = [];
  List<String> _username = [];
  List<int> _followers = [];
  List<String> _pfp = [];
  int _position = 0;
  bool _isLoading = false;

  List<int> get coins => _coins;
  List<int> get followers => _followers;
  List<String> get username => _username;
  List<String> get pfp => _pfp;
  int get position => _position;
  bool get isLoading => _isLoading;

  final AuthService _authService = AuthService();

  Future<void> _fetchLeaderboard(BuildContext context, bool isGlobal) async {
    _isLoading = true;
    notifyListeners();

    try {
      Response response;
      
      if (isGlobal) {
        response = await _authService.getLeaderboard(context);
      } else {
        response = await _authService.getLeaderboardFriends(context);
      }

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        _coins = responseData.map((user) => user["coins"] as int).toList();
        _username = responseData.map((user) => user["username"] as String).toList();
        _pfp = responseData.map((user) => user["profilepic"] as String).toList();
        _followers = responseData.map((user) => user["followers"]["followerAmount"] as int).toList();
        print(responseData);
        print("Coins: $_coins");
        print("Usernames: $_username");
        print("Profile Pictures: $_pfp");
        print("Followers: $_followers");
      } else {
        print('Error fetching leaderboard: ${response.statusCode}');
      }
    } catch (error) {
      print("Error fetching leaderboard $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _fetchPosition(BuildContext context, bool isGlobal) async {
    _isLoading = true;
    notifyListeners();

    try {
      Response response;
      
      if (isGlobal) {
        response = await _authService.getPosition(context);
      } else {
        response = await _authService.getPositionFriends(context);
      }

      if (response.statusCode == 200) {
        _position = jsonDecode(response.body) as int;
      } else {
        print('Error fetching position: ${response.statusCode}');
      }
    } catch (error) {
      print("Error fetching position $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUserData(BuildContext context, bool isGlobal) async {
    await _fetchLeaderboard(context, isGlobal);
    await _fetchPosition(context, isGlobal);
  }
}
