import 'package:flutter/material.dart';
import 'locale_source.dart';
import 'app.dart';
import 'dependency_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  await LocalSource.getInstance();
  runApp(const MyApp());
}