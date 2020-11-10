import 'package:comprasnavarra/screens/localidad_screen.dart';
import 'package:comprasnavarra/screens/tipo_screen.dart';
import 'package:comprasnavarra/screens/zona_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/swiper_screen.dart';
import 'screens/tipo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String tipos = box.read('tipos');
    String zonas = box.read('zonas');
    //String localidad = box.read('localidad');
    return GetMaterialApp(
        title: 'Material App', home: ListaLocalidadesScreen());
    // home: (tipos != null)     ? ListaLocalidadesScreen()
    //     : (zonas != null) ? ListaZonaScreen() : ListaTiposScreen());
  }
}
