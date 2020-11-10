import 'package:comprasnavarra/providers/data_provider.dart';
import 'package:comprasnavarra/screens/nombre_screen.dart';
import 'package:comprasnavarra/screens/zona_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListaLocalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('tipos', null);
    box.write('zonas', null);
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de localidades'),
      ),
      body: _lista(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaZonaScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: dataProvider.getListaLocalidades(
          box.read('zonas') ?? args['zonas'], box.read('tipos') ?? args['tipos']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listElementos(List<String> data) {
    final List<Widget> lista = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('localidad', element);
          args['localidad'] = element;
          Get.offAll(SelectScreen(), arguments: args);
        },
      );
      lista.add(w);
      lista.add(Divider());
    });
    return lista;
  }
}