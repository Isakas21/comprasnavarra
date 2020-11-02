import 'tienda_model.dart';

class Tiendas {
  List<Tienda> lista = new List();
  Tiendas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((json) {
      final pr = Tienda.fromJson(json);
      lista.add(pr);
    });
  }
}
