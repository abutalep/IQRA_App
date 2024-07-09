import 'package:flutter/material.dart';
import 'package:iqra_app/screens/splash.dart';
import 'package:iqra_app/categories/audio_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => AudioProvider(),
    child: const IQRA_App(),
  ));
}

// ignore: camel_case_types
class IQRA_App extends StatelessWidget {
  const IQRA_App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
