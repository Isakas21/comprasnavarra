// To parse this JSON data, do
//
//     final tienda = tiendaFromJson(jsonString);

import 'dart:convert';

Tienda tiendaFromJson(String str) => Tienda.fromJson(json.decode(str));

String tiendaToJson(Tienda data) => json.encode(data.toJson());

class Tienda {
  final _url = "https://www.turismo.navarra.es/imgs/rrtt/";
  final _web =
      "https://www.turismo.navarra.es/esp/organice-viaje/recurso/recurso.aspx?o=";

//"https://www.turismo.navarra.es/imgs/rrtt/03/01/00/00/5967FotoTH2.JPG";
  getImgUrl() {
    return _url + this.path + this.imgFichero;
  }

  getWebUrl() {
    return _web + this.codRecurso;
  }
  Tienda({
    this.codRecurso,
    this.nombre,
    this.urlNombreCast,
    this.tipo,
    this.nombreLocalidad,
    this.descripZona,
    this.idRecursoCategoria,
    this.urlIdRecursoCategoria,
    this.path,
    this.imgFichero,
    this.distancia,
    this.georrX,
    this.georrY,
    this.diplomacompromiso,
  });

  String codRecurso;
  String nombre;
  String urlNombreCast;
  String tipo;
  String nombreLocalidad;
  String descripZona;
  String idRecursoCategoria;
  String urlIdRecursoCategoria;
  String path;
  String imgFichero;
  String distancia;
  String georrX;
  String georrY;
  String diplomacompromiso;

  factory Tienda.fromJson(Map<String, dynamic> json) => Tienda(
        codRecurso: json["CodRecurso"],
        nombre: json["Nombre"],
        urlNombreCast: json["URLNombreCast"],
        tipo: json["Tipo"],
        nombreLocalidad: json["NombreLocalidad"],
        descripZona: json["DescripZona"],
        idRecursoCategoria: json["IdRecursoCategoria"],
        urlIdRecursoCategoria: json["URLIdRecursoCategoria"],
        path: json["Path"],
        imgFichero: json["ImgFichero"],
        distancia: json["Distancia"],
        georrX: json["GEORR_X"],
        georrY: json["GEORR_Y"],
        diplomacompromiso: json["DIPLOMACOMPROMISO"],
      );

  Map<String, dynamic> toJson() => {
        "CodRecurso": codRecurso,
        "Nombre": nombre,
        "URLNombreCast": urlNombreCast,
        "Tipo": tipo,
        "NombreLocalidad": nombreLocalidad,
        "DescripZona": descripZona,
        "IdRecursoCategoria": idRecursoCategoria,
        "URLIdRecursoCategoria": urlIdRecursoCategoria,
        "Path": path,
        "ImgFichero": imgFichero,
        "Distancia": distancia,
        "GEORR_X": georrX,
        "GEORR_Y": georrY,
        "DIPLOMACOMPROMISO": diplomacompromiso,
      };
}
