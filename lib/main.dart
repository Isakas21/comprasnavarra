import 'package:comprasnavarra/screens/tienda_screen.dart';
import 'package:comprasnavarra/screens/tipo_screen.dart';
import 'package:flutter/material.dart';
import 'screens/zona_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TiendaScreen(),
    );
  }
}
