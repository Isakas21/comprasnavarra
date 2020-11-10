import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/tienda_model.dart';
import 'dart:convert';
import '../models/tiendas_model.dart';

class TiendasProvider{
  List<Tienda> listaTiendas = [];
  List<String> listaTipos = [];
  List<String> listaZona = [];
  List<String> listaLocalidad = [];
  List<Tienda> listNombres = [];
  List<Tienda> listTienda = [];
    
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

  Future<List<String>> getListaTipos() async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listaTipos = [];
    listaTiendas.forEach((tnd) {
      if(listaTipos.indexOf(tnd.tipo) < 0){
        // String tip = tnd.tipo.substring(tnd.tipo.indexOf("/") + 2, tnd.tipo.length);
        listaTipos.add(tnd.tipo);
      }
    });
    return listaTipos;
  }    

  Future<List<String>> getListaZonas(String tipo) async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listaZona = [];
    listaTiendas.forEach((tnd) {
      if (tnd.tipo == tipo && listaZona.indexOf(tnd.descripZona) < 0) {
        listaZona.add(tnd.descripZona);
      }
    });
    return listaZona;
  }      
  
  Future<List<String>> getListaLocalidades(String zona, String tipo) async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listaLocalidad = [];
    listaTiendas.forEach((tnd) {
      if (tnd.descripZona == zona && tnd.tipo == tipo && listaLocalidad.indexOf(tnd.nombreLocalidad) < 0) {
        listaLocalidad.add(tnd.nombreLocalidad);
      }
    });
    return listaLocalidad;
  }      

  Future<List<Tienda>> getListaNombres(String zona, String tipo, String localidad) async {
    if (listaTiendas.length == 0) {
      await cargarTiendas();
    }
    listNombres = [];
    listaTiendas.forEach((tnd) {
      if (tnd.descripZona == zona && tnd.tipo == tipo && tnd.nombreLocalidad == localidad && listaLocalidad.indexOf(tnd.nombreLocalidad) < 0) {
        listNombres.add(tnd);
      }
    });
    return listNombres;
  }    

// Future<List<Tienda>> getTienda(String zona, String tipo, String localidad,) async {

//   }    

}
final dataProvider = new TiendasProvider();