import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> transaccionesData = [
  {
    'icon': Icon(CupertinoIcons.home, color: Colors.white),
    'color': Colors.yellow,
    'name': 'Casa',
    'total gastado': 'US\$400',
    'fecha': 'hoy'
  },
  {
    'icon': Icon(CupertinoIcons.car, color: Colors.white),
    'color': Colors.deepPurple,
    'name': 'Transporte',
    'total gastado': 'US\$100',
    'fecha': 'hoy'
  },
  {
    'icon': Icon(CupertinoIcons.book, color: Colors.white),
    'color': Color.fromARGB(255, 255, 183, 207),
    'name': 'Educación',
    'total gastado': 'US\$200',
    'fecha': 'ayer'
  },
  {
    'icon': Icon(
      CupertinoIcons.airplane,
      color: Colors.white,
    ),
    'color': Color.fromARGB(255, 129, 0, 0),
    'name': 'Viaje',
    'total gastado': 'US\$357',
    'fecha': 'ayer'
  }
];
