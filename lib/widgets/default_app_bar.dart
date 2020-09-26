import 'package:flutter/material.dart';
import 'package:github_stars/resources/custom_colors.dart';

AppBar defaultAppBar({String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: CustomColors.primaryColor,
    elevation: 0,
  );
}
