import 'package:comprasnavarra/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SwiperScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.write('tipo', null);
    box.write('zona', null);
    box.write('localidad', null);
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Tiendas de Navarra"),
        ),
        body: _swiper());
  }

  Widget _swiper() {
    return FutureBuilder(
      future: dataProvider.getListaNombres(
          box.read('zona') ?? args['zona'],
          box.read('tipo') ?? args['tipo'],
          box.read('localidad') ?? args['localidad']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //return SwiperWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
