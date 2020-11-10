import 'package:comprasnavarra/models/tienda_model.dart';
import 'package:comprasnavarra/providers/data_provider.dart';
import 'package:comprasnavarra/screens/localidad_screen.dart';
import 'package:comprasnavarra/screens/nombre_screen.dart';
import 'package:comprasnavarra/screens/tienda_screen.dart';
import 'package:comprasnavarra/screens/tipo_screen.dart';
import 'package:comprasnavarra/screens/zona_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/tipo_screen.dart';


void main() {
  runApp(MyApp());
}class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    
    String tipos = box.read('tipos');
    String zonas = box.read('zonas');
    String localidad = box.read('localidad');
    Tienda nombre = box.read('nombre');
    return GetMaterialApp(
      title: 'Material App',
      //home: ListaTiposScreen()
      home: (nombre != null)
            ? SelectScreen()
              :(localidad != null)
                ?  ListaLocalidadesScreen()
                    : (zonas != null)
                      ? ListaZonaScreen()
                        : ListaTiposScreen()
      

    );
   } 
}
