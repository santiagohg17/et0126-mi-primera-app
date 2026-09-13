// Taller de fundamentos de Dart - ET0126
// hecho primero en dartpad y despues copiado aca para subirlo al repo

void main() {
  parte1();
  parte2();
  parte3();
  parte4();
  parte5A();
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

// -- Parte 3 --
void parte3() {
  print('----- PARTE 3: funciones -----');

  print('Aprueba con 3.5? ${aprueba(3.5)}');
  print('Aprueba con 2.0? ${aprueba(2.0)}');

  List<double> notasSemestre = [4.0, 3.5, 2.8, 4.5];
  print('Promedio del semestre: ${promedioSemestre(notasSemestre)}');

  List<double> notasVacias = [];
  print('Promedio con lista vacia: ${promedioSemestre(notasVacias)}');
}

// funcion flecha, es solo una comparacion no necesita mas
bool aprueba(double nota) => nota >= 3.0;

double promedioSemestre(List<double> notas) {
  // si la lista llega vacia no hay por que dividir, si no reviso esto
  // el programa podria dar un error o un resultado raro (NaN)
  if (notas.isEmpty) {
    return 0;
  }

  double suma = 0;
  for (double n in notas) {
    suma = suma + n;
  }
  return suma / notas.length;
}

// -- Parte 4 --
void parte4() {
  print('----- PARTE 4: colecciones -----');

  // lista, porque aca si puede repetirse un nombre si hubo un error al
  // pasar asistencia
  List<String> asistentesHoy = ['Ana', 'Carlos', 'Ana', 'Luisa'];
  print('Asistentes de hoy: $asistentesHoy');

  // set, porque no tiene sentido que un lenguaje aparezca dos veces en
  // lo que el estudiante ya sabe
  Set<String> lenguajesConocidos = {'Dart', 'Java', 'Python'};
  lenguajesConocidos.add('Dart'); // esto no deberia cambiar nada
  print('Lenguajes conocidos: $lenguajesConocidos');

  // probando que pasaria si en vez de set usara una lista
  List<String> lenguajesConLista = ['Dart', 'Java', 'Python'];
  lenguajesConLista.add('Dart');
  print('Si fuera lista se repite: $lenguajesConLista');

  // map, porque necesito buscar rapido la nota de un estudiante usando
  // su nombre como llave
  Map<String, double> notasPorEstudiante = {
    'Ana': 4.5,
    'Carlos': 3.2,
    'Luisa': 2.9,
  };
  print('Nota de Carlos: ${notasPorEstudiante['Carlos']}');
}

// -- Parte 5 --
// Problema A: clasificar el rendimiento de un curso completo
void parte5A() {
  print('----- PARTE 5A: clasificacion de notas -----');

  List<double> notasCurso = [2.5, 3.8, 4.7, 1.9, 3.0, 4.9, 3.5];

  int reprobados = 0;
  int aprobados = 0;
  int sobresalientes = 0;

  for (double nota in notasCurso) {
    if (nota < 3.0) {
      reprobados++;
    } else if (nota < 4.5) {
      aprobados++;
    } else {
      sobresalientes++;
    }
  }

  print('Reprobados: $reprobados');
  print('Aprobados: $aprobados');
  print('Sobresalientes: $sobresalientes');

  // uso for porque ya se cuantas notas hay en la lista, entonces solo
  // recorro todo una vez y listo
}
