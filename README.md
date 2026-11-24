# Mi Bolsillo — App de control de gastos (Flutter + Firebase)

**ET0126 · Programación de Dispositivos Móviles · I.U. Pascual Bravo**
**Estudiante:** Santiago Andrés Higuita Gómez
**Correo:** santiago.higuita224@pascualbravo.edu.co

> Taller Final: presentación y preparación del lanzamiento de la app.

## 1. ¿Qué es Mi Bolsillo?
Una aplicación móvil hecha en **Flutter** para que los estudiantes controlen sus **gastos y presupuesto** del mes y no se queden sin plata antes de fin de mes. Incluye **inicio de sesión con Firebase**.

**Funciones principales:**
- Inicio de sesión / registro / cerrar sesión con **Firebase Authentication**.
- Registrar gastos (valor + categoría) y verlos en una lista con filtro.
- Fijar un **presupuesto** del mes y ver cuánto se ha gastado y cuánto queda.
- **Anillo de avance** dibujado con **Canvas** (CustomPainter).
- **Pagos pendientes** con formulario y validación de datos.
- Almacenamiento local de los gastos con **SharedPreferences**.

## 2. Código fuente
- El código de la app está en la carpeta **[`mi_bolsillo/`](mi_bolsillo/)** de este mismo repositorio.
- Repositorio: `https://github.com/santiagohg17/et0126-mi-primera-app`
- También está el taller de fundamentos de Dart en [`taller_fundamentos_dart/`](taller_fundamentos_dart/).

## 3. Cómo ejecutar el proyecto
Requisitos: tener **Flutter** instalado (`flutter --version`).

```sh
cd mi_bolsillo
flutter pub get
flutter run        # en un dispositivo/emulador Android, o:
flutter run -d chrome   # para probarlo en el navegador
```

Al abrir la app aparece la pantalla de **inicio de sesión**. Puedes registrarte con cualquier correo y una contraseña de 6+ caracteres, o usar la cuenta de prueba:

- **Correo:** `estudiante@mibolsillo.com`
- **Contraseña:** `prueba123`

## 4. Autenticación con Firebase
- Proyecto de Firebase: **mi-bolsillo-app-4821**.
- Método habilitado: **Correo electrónico / contraseña**.
- La configuración está en `mi_bolsillo/lib/firebase_options.dart` (generada con `flutterfire configure`).
- Un "guardián" (`AuthGate`, con `authStateChanges()`) decide si mostrar el login o la app.

**Pruebas realizadas (todas exitosas):**
| Prueba | Resultado |
|---|---|
| Registro de un usuario nuevo | ✔ Crea la cuenta |
| Inicio de sesión correcto | ✔ Entra a la app |
| Contraseña incorrecta | ✔ Rechaza y muestra "Correo o contraseña incorrectos" |
| Cerrar sesión | ✔ Vuelve al login |

## 5. Generación de la APK
Para construir una versión instalable de Android:

```sh
cd mi_bolsillo
flutter build apk --release
```

- La APK queda en: `mi_bolsillo/build/app/outputs/flutter-apk/app-release.apk`
- Para **instalarla** en un teléfono Android: copiar el archivo `.apk` al teléfono y abrirlo (hay que permitir "instalar apps de orígenes desconocidos"). También se puede instalar por cable con `adb install app-release.apk`.
- **Requisito del entorno:** para compilar la APK, Android necesita el **NDK** instalado y las licencias del SDK aceptadas (se instala desde Android Studio → SDK Manager → SDK Tools → *NDK (Side by Side)*).

### APK vs paquete para Google Play
- La **APK** (`.apk`) es el instalador directo de Android: sirve para pruebas e instalación manual.
- Para **publicar en Google Play**, Google exige hoy el formato **AAB (Android App Bundle, `.aab`)**, que se genera con `flutter build appbundle`. Google luego arma las APKs optimizadas para cada dispositivo. Además, una publicación real requiere **firma de producción** (keystore propio), que en este ejercicio no se usa (se firma con la clave de depuración).
- *Fuente consultada:* documentación oficial de Android — "About Android App Bundles" (developer.android.com/guide/app-bundle).

## 6. Estado y limitaciones
- ✅ App funcionando con login de Firebase (probado en navegador y verificado contra Firebase).
- ⚠️ La **APK** se genera con el comando de arriba una vez instalado el NDK en el equipo; la demostración también puede hacerse en el navegador o en un emulador Android.
- Los gastos se guardan **localmente** (todavía no se sincronizan en la nube).
- Falta recuperación de contraseña y sincronización en Firestore (ver mejoras futuras en la ficha).

## 7. Declaración de uso de inteligencia artificial
Para el desarrollo, la configuración de Firebase y la documentación de este proyecto se utilizó una herramienta de inteligencia artificial como apoyo, siguiendo la política del curso. El estudiante comprende el código, el funcionamiento de la autenticación y puede explicar cada parte de la aplicación.

## 8. Materiales de la entrega
- [`ficha_tienda.md`](ficha_tienda.md) — ficha simulada de tienda y política de privacidad.
- [`entrega/capturas/`](entrega/capturas/) — ícono y capturas reales de la app.
- `entrega/presentacion.pdf` — presentación de lanzamiento.

---

## Talleres anteriores (historial del curso)
- **Fundamentos de Dart:** carpeta [`taller_fundamentos_dart/`](taller_fundamentos_dart/).
- **Taller Flutter 1** (inicio de Mi Bolsillo): [tag `taller-1`](https://github.com/santiagohg17/et0126-mi-primera-app/tree/taller-1/mi_bolsillo).
- **Taller de continuación** (formulario de pagos con validación): [tag `taller-2`](https://github.com/santiagohg17/et0126-mi-primera-app/tree/taller-2/mi_bolsillo).
