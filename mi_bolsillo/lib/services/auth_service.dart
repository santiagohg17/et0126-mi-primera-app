import 'package:firebase_auth/firebase_auth.dart';

// Servicio que maneja la autenticacion con Firebase.
// Aqui esta todo lo relacionado con entrar, registrarse y salir.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream que avisa cuando el usuario inicia o cierra sesion.
  // El AuthGate lo escucha para saber que pantalla mostrar.
  Stream<User?> get cambiosDeSesion => _auth.authStateChanges();

  User? get usuarioActual => _auth.currentUser;

  // Iniciar sesion con correo y contrasena.
  // Devuelve null si todo sale bien, o un mensaje de error si falla.
  Future<String?> iniciarSesion(String correo, String clave) async {
    try {
      await _auth.signInWithEmailAndPassword(email: correo, password: clave);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensajeError(e.code);
    }
  }

  // Registrar un usuario nuevo con correo y contrasena.
  Future<String?> registrar(String correo, String clave) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: correo, password: clave);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensajeError(e.code);
    }
  }

  // Cerrar la sesion del usuario.
  Future<void> cerrarSesion() async {
    await _auth.signOut();
  }

  // Traduce los codigos de error de Firebase a mensajes claros en espanol.
  String _mensajeError(String codigo) {
    switch (codigo) {
      case 'invalid-email':
        return 'El correo no tiene un formato valido.';
      case 'user-not-found':
        return 'No existe una cuenta con ese correo.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Correo o contrasena incorrectos.';
      case 'email-already-in-use':
        return 'Ese correo ya esta registrado.';
      case 'weak-password':
        return 'La contrasena debe tener al menos 6 caracteres.';
      default:
        return 'Ocurrio un error. Intenta de nuevo.';
    }
  }
}
