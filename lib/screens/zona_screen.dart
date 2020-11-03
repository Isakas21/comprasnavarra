import 'package:flutter/material.dart';
import '../providers/data_provider.dart';
import '../providers/data_provider.dart';

class ZonaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zonas de compra de navarra"),
      ),
      body: _listZonas(context),
    );
  }

  Widget _listZonas(BuildContext context) {
    print(dataProvider.cargarZona());
    return FutureBuilder(
      future: dataProvider.cargarZona(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
