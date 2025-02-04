import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'dart:async';
import 'dart:convert';

class CoinProvider extends ChangeNotifier {
  int _coin = 0;

  int get coin => _coin;

  final AuthService _authService = AuthService();

  CoinProvider(BuildContext context){
    _fetchCoins(context);
  }

  Future<void> _fetchCoins(BuildContext context) async{
    try{
      final response = await _authService.getUserProfile(context);
      if (response.statusCode == 200){
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['coins'] != null){
          _coin = responseData['coins'];
          notifyListeners();
        }
      }
      else{
        print("Error fetching coins:${response.statusCode}");
      }
      
    }
    catch(error){
      print("Error fetching coins: $error");
    }
  }

  Future<void> _updateCoins(BuildContext context, int coins) async {
    try {
      final response = await _authService.updateUserProfile(context, {'coins': coins});
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['coins'] != null) {
          _coin = responseData['coins'];
          notifyListeners();
        }
      } else {
        print('Error updating coins: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating coins: $error');
    }
  }

  Future<void> fetchUserData(BuildContext context) async {
    await _fetchCoins(context);
  }

  void incrementCoin(BuildContext context) async {
    _coin++;
    notifyListeners();
    await _updateCoins(context, _coin);
  }

  void resetCoin(BuildContext context) async {
    _coin = 0;
    notifyListeners();
    await _updateCoins(context, _coin);
  }
}