import 'package:flutter/material.dart';

class SwiperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tiendas de Navarra"),
        ),
        body: _swiper());
  }

  Widget _swiper() {
    return FutureBuilder(
      //future: tiendasProvider.getListaTiendas(),
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
