// Taller de fundamentos de Dart - ET0126
// hecho primero en dartpad y despues copiado aca para subirlo al repo

void main() {
  parte1();
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
