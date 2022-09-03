import 'package:flutter/material.dart';

import 'src/app_widget.dart';
import 'src/di/di.dart';

void main() {
  DI.setup();
  runApp(const AppWidget());
}
