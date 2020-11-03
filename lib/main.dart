import 'package:comprasnavarra/screens/tipo_screen.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text('INICIO')
        ),
      body: ListaTiposScreen(),
    );
  }
}