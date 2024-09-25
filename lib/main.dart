import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skycast/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(const SkyCastApp());
    },
  );
}
