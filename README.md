# fintrack

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- fl charter
- cupertino icons

## guía de la arquitectura: 

### Control de Gastos Personales

*Descripción:* Aplicación para registrar ingresos y gastos mensuales.*

### Arquitectura

*main.dart* — corre la función MyApp (principal, donde se renderiza toda la aplicación)

*app.dart — donde se coloca la autenticación (en el futuro), repository provider, autenticacion blocs*

*app_view* — se renderiza los elementos del navigatorbottom

*homescreen* — centro de distribución (el mismo nav para todos)

*main_screen* - trabaja con los detalles del incio, la tarjeta, etc…

*data.dart* — mockup data, se cambia luego con los datos de la base de datos