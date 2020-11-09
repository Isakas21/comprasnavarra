import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/tienda_model.dart';
import '../models/tiendas_model.dart';

class TiendasProvider {
  List<Tienda> listaTiendas = [];
  List<String> listaTipos = [];
  List<String> listaZonas = [];
  List<String> listaLocalidad = [];
  List<Tienda> listNombres = [];

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

  Future<List<String>> getListaLocalidades(String zona, String tipo) async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listaTiendas.forEach((tnd) {
      if (tnd.descripZona == zona &&
          tnd.tipo == tipo &&
          listaLocalidad.indexOf(tnd.nombreLocalidad) < 0) {
        listaLocalidad.add(tnd.nombreLocalidad);
      }
    });
    return listaLocalidad;
  }

  Future<List<Tienda>> getListaNombres(
      String zona, String tipo, String localidad) async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listaTiendas.forEach((tnd) {
      if (tnd.descripZona == zona &&
          tnd.tipo == tipo &&
          tnd.nombreLocalidad == localidad &&
          listaLocalidad.indexOf(tnd.nombreLocalidad) < 0) {
        listNombres.add(tnd);
      }
    });
    return listNombres;
  }
}

final dataProvider = new TiendasProvider();
