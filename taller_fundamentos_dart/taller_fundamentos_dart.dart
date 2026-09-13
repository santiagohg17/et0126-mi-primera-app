// Taller de fundamentos de Dart - ET0126
// hecho primero en dartpad y despues copiado aca para subirlo al repo

void main() {
  parte1();
  parte2();
}

// -- Parte 1 --
// ficha digital de un estudiante para el sistema de matricula
void parte1() {
  print('----- PARTE 1: ficha del estudiante -----');

  String nombre = 'Santiago Higuita';
  int edad = 19;
  double promedio = 4.2;
  String programa = 'Ingenieria de Software';
  int semestre = 3;
  bool matriculado = true;

  print('Nombre: $nombre');
  print('Edad: $edad anios');
  print('Programa: $programa');
  print('Semestre: $semestre');
  print('Promedio: $promedio');
  print('Matriculado: $matriculado');

  // si la edad quedara guardada como String no podria hacer cuentas con
  // ella directamente (por ejemplo saber si ya es mayor de edad o sumarle
  // los anios que lleva en la carrera), tocaria estar convirtiendola con
  // int.parse() cada vez y ahi es facil que el programa se caiga si el
  // dato llega mal escrito
}

// -- Parte 2 --
// no todos los estudiantes tienen apodo registrado en el sistema
void parte2() {
  print('----- PARTE 2: null safety -----');

  String? apodo1 = null; // este si puede ser null, por eso el ?
  String? apodo2 = 'Santi';

  mostrarApodo(apodo1);
  mostrarApodo(apodo2);

  // el apodo puede ser null porque no es un dato que todo estudiante tenga
  // registrado, en cambio el nombre, la edad o el promedio de la parte 1
  // si son datos que siempre existen entonces esos no deberian ser nullable

  // que pasa si uso el operador ! sobre algo que es null:
  // String pruebaError = apodo1!;
  // si descomento esa linea el codigo SI compila normal, el error solo
  // sale cuando se ejecuta (Null check operator used on a null value).
  // osea el error aparece al correr el programa, no al escribirlo
}

void mostrarApodo(String? apodo) {
  if (apodo != null) {
    print('Apodo: $apodo');
  } else {
    print('Este estudiante no tiene apodo registrado');
  }
}
