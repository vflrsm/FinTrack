import 'package:flutter/material.dart';

// ignore: camel_case_types
class transaccionesPage extends StatelessWidget {
  const transaccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Transacciones'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Transaccions Page'),
      ),
    );
  }
}
