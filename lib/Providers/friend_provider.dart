import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend-Service/auth_service.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

class FriendProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _followers = [];
  List<Map<String, dynamic>> get followers => _followers;

  List<Map<String, dynamic>> _following = [];
  List<Map<String, dynamic>> get following => _following;

  List<Map<String, dynamic>> _nonFriend = [];
  List<Map<String, dynamic>> get nonFriend => _nonFriend;

  final AuthService _authService = AuthService();
  late Future<void> initialization;

  FriendProvider(BuildContext context) {
    initialization = _initialize(context);
  }

  Future<void> _initialize(BuildContext context) async {
    await fetchFollowers(context);
    await fetchFollowing(context);
    await fetchNonFriends(context);
  }

  Future<void> fetchFollowers(BuildContext context) async {
    try {
      final getResponse = await _authService.getUserProfile(context);
      if (getResponse.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(getResponse.body);
        List<dynamic> userIDsDynamic = result["followers"]["followerAccounts"];
        List<String> userIDs = userIDsDynamic.map((id) => id.toString()).toList();
        if (userIDs.isNotEmpty) {
          final followerDetailsResponse = await _authService.getFriends(context, userIDs);
          if (followerDetailsResponse.statusCode == 200) {
            final List<dynamic> followerDetails = jsonDecode(followerDetailsResponse.body);
            _followers = followerDetails.map((follower) => {
              'username': follower['username'],
              'fullname': follower['fullname'],
              'profilepic': follower['profilepic'] ?? 'assets/defaultguy.png',
            }).toList();
            notifyListeners();
          } else {
            throw Exception('Failed to load follower details');
          }
        } else {
          print('No userIDs found');
        }
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      print('Error fetching user details: $error');
    }
  }

  Future<void> fetchFollowing(BuildContext context) async {
    try {
      final getResponse = await _authService.getUserProfile(context);
      if (getResponse.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(getResponse.body);
        List<dynamic> userIDsDynamic = result["following"]["followingAccounts"];
        List<String> userIDs = userIDsDynamic.map((id) => id.toString()).toList();
        if (userIDs.isNotEmpty) {
          final followingDetailsResponse = await _authService.getFriends(context, userIDs);
          if (followingDetailsResponse.statusCode == 200) {
            final List<dynamic> followingDetails = jsonDecode(followingDetailsResponse.body);
            _following = followingDetails.map((following) => {
              'username': following['username'],
              'fullname': following['fullname'],
              'profilepic': following['profilepic'] ?? 'assets/defaultguy.png',
            }).toList();
            notifyListeners();
          } else {
            throw Exception('Failed to load follower details');
          }
        } else {
          print('No userIDs found');
        }
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (error) {
      print('Error fetching user details: $error');
    }
  }

  Future<void> fetchNonFriends(BuildContext context) async {
    try {
      final getResponse = await _authService.getUserProfile(context);
      final EveryResponse = await _authService.getEveryID(context);

      if (getResponse.statusCode == 200 && EveryResponse.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(getResponse.body);
        List<dynamic> allUserIDsList = jsonDecode(EveryResponse.body);
        Set<String> allUserIDs = allUserIDsList.map((id) => id.toString()).toSet();

        List<dynamic> userIDsDynamic = result["following"]["followingAccounts"];
        Set<String> followingUserIDs = userIDsDynamic.map((id) => id.toString()).toSet();

        Set<String> notFollowing = allUserIDs.difference(followingUserIDs);

        notFollowing.remove(result["_id"]);

        if (notFollowing.isNotEmpty) {
          final nonFriendDetailsResponse = await _authService.getFriends(context, notFollowing.toList());
          if (nonFriendDetailsResponse.statusCode == 200) {
            final List<dynamic> nonFriendDetails = jsonDecode(nonFriendDetailsResponse.body);
            _nonFriend = nonFriendDetails.map((nonFriend) => {
              'username': nonFriend['username'],
              'fullname': nonFriend['fullname'],
              'profilepic': nonFriend['profilepic'] ?? 'assets/defaultguy.png',
              'followerNum': nonFriend['followers']['followerAmount'],
              '_id': nonFriend['_id']
            }).toList();
            notifyListeners();
          } else {
            throw Exception('Failed to load non-friend details');
          }
        } else {
          print('No userIDs found');
        }
      } else {
        throw Exception('Failed to load nonfriend profile');
      }
    } catch (error) {
      print('Error fetching nonfriend user details: $error');
    }
  }

  Future<void> updateFollowing(BuildContext context, String id) async {
    try {
      final getResponse = await _authService.getUserProfile(context);
      if (getResponse.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(getResponse.body);
        List<dynamic> userIDsDynamic = result["following"]["followingAccounts"];
        List<String> userIDs = userIDsDynamic.map((id) => id.toString()).toList();
        userIDs.add(id);
        final response = await _authService.updateUserProfile(context, {'following': {"followingAccounts": userIDs, "followingAmount": userIDs.length}});
        if (response.statusCode == 200) {
          print("following updated successfully");
          notifyListeners();
        } else {
          print('Error updating following: ${response.statusCode}');
        }
      }
    } catch (error) {
      print('Error updating following: $error');
    }
  }

  Future<void> updateOtherPerson(BuildContext context, String id) async {
    try {
      final getResponse = await _authService.updateOtherUser(context, id);
      if (getResponse.statusCode == 200) {
        print("other user updated successfully");
        notifyListeners();
      } else {
        print("error updating other user");
      }
    } catch (error) {
      print('Error updating other user: $error');
    }
  }

Future<void> fetchUserData(BuildContext context) async {
    await fetchFollowers(context);
    await fetchFollowing(context);
    await fetchNonFriends(context);
  }

}
