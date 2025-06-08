class Empleado {
  final String nombre;
  final String puesto;
  final double salario;

  Empleado({required this.nombre, required this.puesto, required this.salario});
}

double calcularTotalSalarios(List<Empleado> plantilla) {
  return plantilla.fold(0, (suma, empleado) => suma + empleado.salario);
}

double calcularSalarioPromedio(List<Empleado> equipo) {
  if (equipo.isEmpty) return 0;
  return calcularTotalSalarios(equipo) / equipo.length;
}

void main() {
  final empleados = [
    Empleado(nombre: 'Juan Alvarenga', puesto: 'Desarrollador', salario: 4200),
    Empleado(nombre: 'Jhoger Quezada', puesto: 'Programador', salario: 3800),
    Empleado(nombre: 'Manuel Portillo', puesto: 'Gerente', salario: 5500),
    Empleado(nombre: 'Didier Trejo', puesto: 'Tester', salario: 3200),
    Empleado(nombre: 'Daniel Paz', puesto: 'Graficador', salario: 4800),
  ];

  final totalSalarios = calcularTotalSalarios(empleados);
  final salarioPromedio = calcularSalarioPromedio(empleados);

  print('Nómina de la empresa:');
  print('______________________________________________');

  for (final emp in empleados) {
    print(
      '- ${emp.nombre.padRight(15)} '
      '| ${emp.puesto.padRight(18)} '
      '| \$${emp.salario.toStringAsFixed(0)}',
    );
  }

  print('\nResumen financiero:');
  print('- Salario total: \$${totalSalarios.toStringAsFixed(2)}');
  print('- Salario promedio: \$${salarioPromedio.toStringAsFixed(2)}');
  print('- Personal total: ${empleados.length} empleados');
}
