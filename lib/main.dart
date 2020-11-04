import 'package:comprasnavarra/screens/tipo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/tipo_screen.dart';

main(){
  runApp(MyApp());
}class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String tipos = box.read('tipos');
    String zonas = box.read('zonas');
    String localidad = box.read('localidad');
    return GetMaterialApp(
      title: 'Material App',
      home: (tipos != null)
        ? ListaTiposScreen()
        : 
        
      
      
    );
   } 
}