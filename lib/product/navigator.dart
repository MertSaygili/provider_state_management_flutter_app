import 'package:flutter/material.dart';

class Navigation {
  void navigateToDestination(BuildContext context, Widget destination) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
  }
}
