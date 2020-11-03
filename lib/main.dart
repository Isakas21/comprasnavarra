import 'package:flutter/material.dart';

import 'screens/zona_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Castillos y palacios de Navarra"),
      ),
      body: ZonaScreen(),
    );
  }
}
