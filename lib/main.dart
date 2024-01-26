import 'package:flutter/material.dart';
import 'package:mena_conf/locator.dart';
import 'package:mena_conf/ui/pages/main_app/main_app_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MainAppView());
}


