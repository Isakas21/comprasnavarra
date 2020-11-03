import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/tienda_model.dart';
import 'dart:convert';

import '../models/tiendas_model.dart';

class TiendasProvider{
  List<Tienda> _listaTiendas = [];

    Future<List<Tienda>> cargarTiendas() async {
    final data = await rootBundle
        .loadString('assets/data/Opendata_Resultados_PM_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Tiendas tiendas = Tiendas.fromJsonList(openDataRow);
    _listaTiendas = tiendas.lista;
    return _listaTiendas;
  }
       
      
}