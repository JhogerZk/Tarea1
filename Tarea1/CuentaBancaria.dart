class CuentaBancaria {
  final String titular;
  double _saldo;

  CuentaBancaria(this.titular, [this._saldo = 0.0]);

  void depositar(double monto) {
    if (monto <= 0) {
      print('Error: Monto inválido para depósito');
      return;
    }
    _saldo += monto;
    print('Depósito exitoso: \$${monto.toStringAsFixed(2)}');
  }

  void retirar(double monto) {
    if (monto <= 0) {
      print('Error: Monto inválido para retiro');
      return;
    }

    if (_saldo < monto) {
      print(
        'Fondos insuficientes al intentar retirar \$${monto.toStringAsFixed(2)}. '
        'Saldo actual: \$${_saldo.toStringAsFixed(2)}',
      );
      return;
    }

    _saldo -= monto;
    print('Retiro exitoso: \$${monto.toStringAsFixed(2)}');
  }

  double consultarSaldo() {
    return _saldo;
  }

  void mostrarEstado() {
    print('Cuenta de $titular');
    print('Saldo actual: \$${_saldo.toStringAsFixed(2)}');
    print('_________________________');
  }
}

void main() {
  final cuenta = CuentaBancaria('Jhoger Quezada', 1000.0);

  print('=== ESTADO INICIAL ===');
  cuenta.mostrarEstado();

  print('\n-- Intentando depositar \$500.00 --');
  cuenta.depositar(500.0);
  cuenta.mostrarEstado();

  print('\n-- Intentando retirar \$200.00 --');
  cuenta.retirar(200.0);
  cuenta.mostrarEstado();

  print('\n-- Intentando retirar \$1500.00 --');
  cuenta.retirar(1500.0); // Retiro mayor al saldo
  cuenta.mostrarEstado();

  print('\n-- Intentando depositar \$-100.00 --');
  cuenta.depositar(-100.0); // Monto inválido
  cuenta.mostrarEstado();

  print('\n=== OPERACIONES FINALIZADAS ===');
  print('Saldo final: \$${cuenta.consultarSaldo().toStringAsFixed(2)}');
}
