import 'package:flutter/material.dart';
import 'package:github_stars/resources/custom_colors.dart';

AppBar defaultAppBar() {
  return AppBar(
    title: const Text('GitHub Stars'),
    centerTitle: true,
    backgroundColor: CustomColors.primaryColor,
  );
}
