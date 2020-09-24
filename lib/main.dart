import 'package:flutter/material.dart';
import 'package:github_stars/core/app.dart';

import 'core/di/service_locator.dart';

void main() {
  setup(sl);
  runApp(MyApp());
}
