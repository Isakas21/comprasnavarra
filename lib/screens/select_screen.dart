import 'package:comprasnavarra/providers/data_provider.dart';
import 'package:comprasnavarra/screens/localidad_screen.dart';
import 'package:comprasnavarra/widget/swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SelectScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    box.write('tipos', null);
    box.write('zonas', null);
    box.write('localidad', null);
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Castillos y palacios de Navarra"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Center(
                  child: Text(
                "Swiper Nombres",
                style: Theme.of(context).textTheme.headline6,
              )),
              SizedBox(
                height: 20.0,
              ),
              _swiper(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.offAll(ListaLocalidadesScreen(), arguments: args);
          },
          child: Icon(Icons.arrow_back),
        ));
  }

  Widget _swiper() {
    return FutureBuilder(
      future: dataProvider.getListaNombres(
          box.read('zonas') ?? args['zonas'],
          box.read('tipos') ?? args['tipos'],
          box.read('localidad') ?? args['localidad']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SwiperWidget(lista: snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
