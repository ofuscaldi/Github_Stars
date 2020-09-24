import 'package:flutter/material.dart';
import 'package:github_stars/resources/custom_colors.dart';

AppBar defaultAppBar() {
  return AppBar(
    title: Text('My App Bar'),
    backgroundColor: CustomColors.primaryColor,
  );
}
