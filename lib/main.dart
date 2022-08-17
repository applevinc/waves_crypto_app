import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waves_crypto_app/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}
