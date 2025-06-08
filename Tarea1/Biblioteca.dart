class Libro {
  final String titulo;
  final String autor;
  final int anioPublicacion;

  Libro({
    required this.titulo,
    required this.autor,
    required this.anioPublicacion,
  });

  @override
  String toString() {
    return '"$titulo" publicado en $anioPublicacion por $autor';
  }
}

class Biblioteca {
  final List<Libro> _libros = [];

  void agregarLibro(Libro libro) {
    _libros.add(libro);
    print('Libro agregado: ${libro.titulo}');
  }

  bool eliminarLibro(String titulo) {
    final inicial = _libros.length;
    _libros.removeWhere((libro) => libro.titulo == titulo);
    final eliminados = inicial - _libros.length;

    if (eliminados > 0) {
      print('Se elimino "$titulo" de la biblioteca');
      return true;
    } else {
      print('No se encontro "$titulo" en la biblioteca');
      return false;
    }
  }

  List<Libro> buscarPorAutor(String autor) {
    final resultados = _libros
        .where(
          (libro) => libro.autor.toLowerCase().contains(autor.toLowerCase()),
        )
        .toList();

    if (resultados.isEmpty) {
      print('No se encontraron libros de $autor');
    } else {
      print('Libros encontrados de $autor: ${resultados.length}');
    }

    return resultados;
  }

  List<Libro> obtenerLibrosOrdenadosPorAnio() {
    final copia = List<Libro>.from(_libros);
    copia.sort((a, b) => a.anioPublicacion.compareTo(b.anioPublicacion));
    return copia;
  }

  void mostrarLibros() {
    if (_libros.isEmpty) {
      print('La biblioteca no tiene libros');
      return;
    }

    print('\nLibros en la biblioteca (${_libros.length}):');
    for (var i = 0; i < _libros.length; i++) {
      print('${i + 1}. ${_libros[i]}');
    }
  }
}

void main() {
  final miBiblioteca = Biblioteca();

  miBiblioteca.agregarLibro(
    Libro(
      titulo: 'La Divina Comedia',
      autor: 'Dante Alighieri',
      anioPublicacion: 1321,
    ),
  );

  miBiblioteca.agregarLibro(
    Libro(
      titulo: 'Los Cipotes',
      autor: 'Ramon Amaya Amador',
      anioPublicacion: 1963,
    ),
  );

  miBiblioteca.agregarLibro(
    Libro(
      titulo: 'Padre Rico, Padre Pobre',
      autor: 'Robert Kiyosaki',
      anioPublicacion: 1997,
    ),
  );

  miBiblioteca.mostrarLibros();

  final librosRamon = miBiblioteca.buscarPorAutor('Ramon Amaya Amador');
  for (final libro in librosRamon) {
    print('- ${libro.titulo}');
  }

  print('\nLibros ordenados por año:');
  final ordenados = miBiblioteca.obtenerLibrosOrdenadosPorAnio();
  for (final libro in ordenados) {
    print('${libro.anioPublicacion}: ${libro.titulo}');
  }

  miBiblioteca.eliminarLibro('Cien años de soledad'); // Libro que no existe
  miBiblioteca.eliminarLibro('Los Cipotes'); // Libro existente

  miBiblioteca.mostrarLibros();
}
