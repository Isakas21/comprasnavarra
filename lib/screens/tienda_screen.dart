import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class TiendaScreen extends StatelessWidget {
  final Tienda patrimonio;
  final map = new MapController();
  var latlon;

  _MapaScreenState({@required this.patrimonio}) {
    latlon = UTM.fromUtm(
      easting: double.parse(patrimonio.georrX),
      northing: double.parse(patrimonio.georrY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          _header(),
          SizedBox(
            height: 30.0,
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
          Text(patrimonio.nombre,
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
                  placeholder: AssetImage('assets/images/cast.jpg'),
                  image: AssetImage(patrimonio.getImgPath()),
                  fit: BoxFit.cover,
                  height: 120.0,
                ),
              ),
              Column(
                children: [
                  Text(patrimonio.nombreLocalidad),
                  Text("Información web"),
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
            'pk.eyJ1IjoiYWV0eGFiYW8iLCJhIjoiY2tnNHltbHZyMHBqMzJ5cjI5bXd4YzRkOSJ9.AA2XNQgBS47ru9ZXidYX2g',
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