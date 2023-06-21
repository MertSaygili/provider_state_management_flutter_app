import 'package:flutter/material.dart';

class NavigatorManager {
  void navigateToDestination(BuildContext context, Widget destination) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
  }
}
