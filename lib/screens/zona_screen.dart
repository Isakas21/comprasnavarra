import 'package:flutter/material.dart';

class ZonaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Zonas de compra de navarra"),
        ),
        body: _listZonas(context),
    );
  }
}

Widget _listZonas(BuildContext context) {
  FutureBuilder(
    future: Future,
    initialData: InitialData,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ;
    },
  ),
}