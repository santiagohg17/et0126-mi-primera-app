import 'package:flutter/material.dart';

import '../services/auth_service.dart';

// Pantalla de inicio de sesion y registro.
// El mismo formulario sirve para las dos cosas, cambiando un interruptor.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _correoCtrl = TextEditingController();
  final _claveCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _esRegistro = false; // false = iniciar sesion, true = registrarse
  bool _cargando = false;
  String? _error;

  // Envia el formulario al servicio de autenticacion.
  Future<void> _enviar() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _cargando = true;
      _error = null;
    });

    final correo = _correoCtrl.text.trim();
    final clave = _claveCtrl.text.trim();

    // Segun el interruptor, registra o inicia sesion.
    final String? error = _esRegistro
        ? await _auth.registrar(correo, clave)
        : await _auth.iniciarSesion(correo, clave);

    if (!mounted) return;
    setState(() {
      _cargando = false;
      _error = error; // si queda null, el AuthGate lo lleva solo al Home
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.account_balance_wallet,
                    size: 70, color: Colors.teal),
                const SizedBox(height: 10),
                const Text('Mi Bolsillo',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal)),
                Text(_esRegistro ? 'Crea tu cuenta' : 'Inicia sesion',
                    style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 24),

                // Campo de correo
                TextFormField(
                  controller: _correoCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (v) => (v == null || !v.contains('@'))
                      ? 'Escribe un correo valido'
                      : null,
                ),
                const SizedBox(height: 14),

                // Campo de contrasena
                TextFormField(
                  controller: _claveCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contrasena',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (v) => (v == null || v.length < 6)
                      ? 'Minimo 6 caracteres'
                      : null,
                ),
                const SizedBox(height: 10),

                // Mensaje de error (por ejemplo, credenciales invalidas)
                if (_error != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(_error!,
                              style: const TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 14),

                // Boton principal
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _cargando ? null : _enviar,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: _cargando
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white))
                        : Text(_esRegistro ? 'Registrarme' : 'Entrar'),
                  ),
                ),

                // Cambiar entre iniciar sesion y registrarse
                TextButton(
                  onPressed: () => setState(() {
                    _esRegistro = !_esRegistro;
                    _error = null;
                  }),
                  child: Text(_esRegistro
                      ? 'Ya tengo cuenta, iniciar sesion'
                      : 'No tengo cuenta, registrarme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
