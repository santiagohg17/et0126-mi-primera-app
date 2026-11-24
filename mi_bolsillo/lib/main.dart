import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'widgets/auth_gate.dart';

// main ahora es async porque hay que inicializar Firebase antes de arrancar.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MiBolsilloApp());
}

class MiBolsilloApp extends StatelessWidget {
  const MiBolsilloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Bolsillo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      // El AuthGate decide si mostrar el login o la app.
      home: const AuthGate(),
    );
  }
}
