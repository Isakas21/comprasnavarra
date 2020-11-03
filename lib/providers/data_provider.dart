import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/tienda_model.dart';
import '../models/tiendas_model.dart';

class TiendasProvider {
  List<Tienda> listaTiendas = [];
  List<String> listaTipos = [];
  List<String> listaZonas = [];

  Future<List<Tienda>> cargarTiendas() async {
    final data = await rootBundle
        .loadString('assets/data/Opendata_Resultados_CM_es.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Tiendas tiendas = Tiendas.fromJsonList(openDataRow);
    listaTiendas = tiendas.lista;
    return listaTiendas;
  }

  Future<List<String>> cargarZona() async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listaZonas = [];
    listaTiendas.forEach((pr) {
      if (listaZonas.indexOf(pr.descripZona) < 0) {
        listaZonas.add(pr.descripZona);
      }
    });
    return listaZonas;
  }
}

final dataProvider = new TiendasProvider();
