import 'package:comprasnavarra/models/tienda_model.dart';
import 'package:comprasnavarra/screens/zona_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:utm/utm.dart';
import 'package:latlong/latlong.dart';

class TiendaScreen extends StatefulWidget {
  final Tienda tienda;

  TiendaScreen({@required this.tienda});

  @override
  _TiendaScreenState createState() => _TiendaScreenState(tienda: tienda);
}

class _TiendaScreenState extends State<TiendaScreen> {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();

  final Tienda tienda;
  final map = new MapController();
  var latlon;

  _TiendaScreenState({@required this.tienda}) {
    latlon = UTM.fromUtm(
      easting: double.parse(tienda.georrX),
      northing: double.parse(tienda.georrY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
  }

  @override
  Widget build(BuildContext context) {
    box.write('tipos', null);
    box.write('zonas', null);
    box.write('localidad', null);
    box.write('nombre', null);
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 23.0,
          ),
          _header(),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: _flutterMap(),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Column(
        children: [
          Text(tienda.nombre,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/tienda.jpg'),
                  image: NetworkImage(tienda.getImgUrl()),
                  fit: BoxFit.cover,
                  height: 120.0,
                ),
              ),
              Column(
                children: [
                  Text(tienda.nombreLocalidad),
                  Text(tienda.descripZona),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _flutterMap() {
    return new FlutterMap(
      mapController: map,
      options: new MapOptions(
        center: new LatLng(latlon.lat, latlon.lon),
        zoom: 18.0,
      ),
      layers: [
        _mapa(),
        _markers(),
      ],
    );
  }

  _mapa() {
    return new TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoiaXNha2FzIiwiYSI6ImNraDNianhkcjBrMDkyeXBkZ3htcjV0MzUifQ.gwcZJnFUXq3PMiNj1wFXMA',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point: new LatLng(latlon.lat, latlon.lon),
          builder: (ctx) => new Container(
            child: Icon(Icons.place, color: Colors.red[700]),
          ),
        ),
      ],
    );
  }
}
