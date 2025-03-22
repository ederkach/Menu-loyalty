import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:menu_loyalty/app/app.dart';
import 'package:menu_loyalty/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  bootstrap(() => const App());
}
