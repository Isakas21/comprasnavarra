import 'package:comprasnavarra/screens/tipo_screen.dart';
import 'package:flutter/material.dart';

import 'screens/tipo_screen.dart';

main(){
  runApp(MyApp());
}class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'tipos',
      routes: <String, WidgetBuilder>{
        'tipos': (context) => ListaTiposScreen(),
        // '': (context) => ,
        // '': (context) => ,
        // '': (context) => ,
      },
    );
   } 
}