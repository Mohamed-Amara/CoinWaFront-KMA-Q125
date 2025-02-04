
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottom-Navigation-Bar/Leaderboards/leaderboard2.dart';
import 'package:provider/provider.dart';

class LeadboardModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
