import 'package:flutter/material.dart';

class TransaccionesPage extends StatefulWidget {
  const TransaccionesPage({super.key});

  @override
  State<TransaccionesPage> createState() => TransaccionesPageState();
}

class TransaccionesPageState extends State<TransaccionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Transacciones'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
