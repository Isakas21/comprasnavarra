// import 'package:comprasnavarra/providers/data_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import '../models/tienda_model.dart';

// class ListaTiposScreen extends StatelessWidget {
//   Map<String, Object> args = new Map<String, Object>();
//     final box = GetStorage();

//   @override
//   Widget build(BuildContext context) {
//     box.write('tipos', null);
//     box.write('zonas', null);
//     box.write('localidad', null);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de tipos'),
//       ),
//       body: _lista(),
//     );
//   }

//   Widget _lista() {
//     return FutureBuilder(
//         future: dataProvider.cargarTiendas(),
//         initialData: [],
//         builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView(
//               children: _listaElementos(snapshot.data),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         });
//   }

//    List<Widget> _listaElementos(List<Tienda> data) {
//     final List<Widget> lst = [];
//     data.forEach((tnd) {
//       final w = ListTile(
//         title: Text(tnd.tipo),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       );
//       lst.add(w);
//       lst.add(Divider());
//     });
//     return lst;
//   }
//}
import 'package:comprasnavarra/providers/data_provider.dart';
import 'package:comprasnavarra/screens/zona_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/tienda_model.dart';
import '../models/tiendas_model.dart';
class ListaTiposScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.write('tipos', null);
    box.write('zonas', null);
    box.write('localidad', null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tipos'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: dataProvider.getListaTipos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

   List<Widget> _listaElementos(List<String> data) {
    final List<Widget> lst = [];
    data.forEach((tnd) {
      final w = ListTile(
        title: Text(tnd),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('tipos', tnd);
          args['tipos'] = tnd;
          Get.offAll(ListaZonaScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}