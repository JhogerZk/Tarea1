void main() {
  List<int> original = [1, 2, 3, 2, 4, 1, 5, 3, 6];
  List<int> unicos = obtenerElementosUnicos(original);

  print("Lista original: $original");
  print("Elementos únicos: $unicos");
}

List<T> obtenerElementosUnicos<T>(List<T> lista) {
  return lista.toSet().toList();
}
