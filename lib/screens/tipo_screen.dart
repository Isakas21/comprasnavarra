import 'package:comprasnavarra/providers/data_provider.dart';
import 'package:flutter/material.dart';

import '../models/tienda_model.dart';

class ListaTiposScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTipos Screen'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: dataProvider.cargarTiendas(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: _listaElementos(snapshot.data),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  List<Widget> _listaElementos(List<Tienda> data) {
    final List<Widget> lst = [];
    data.forEach((tnd) {
      final w = ListTile(
        title: Text(tnd.nombre),
        subtitle: Text(tnd.tipo),
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
