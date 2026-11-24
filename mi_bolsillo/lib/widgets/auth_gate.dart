import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

// "Guardian" de la app: escucha si hay una sesion iniciada y decide
// que pantalla mostrar. Si hay usuario, muestra el Home; si no, el Login.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return StreamBuilder(
      stream: auth.cambiosDeSesion,
      builder: (context, snapshot) {
        // Mientras Firebase revisa si hay sesion, muestra un cargando.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // Si hay datos, hay un usuario con sesion iniciada.
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        // Si no, pide iniciar sesion.
        return const LoginScreen();
      },
    );
  }
}
