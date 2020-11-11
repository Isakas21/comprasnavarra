import 'package:comprasnavarra/models/tienda_model.dart';
import 'package:comprasnavarra/screens/tienda_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  final List<Tienda> lista;

  const SwiperWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    final screenSize = MediaQuery.of(context).size;

    return Swiper(
      itemWidth: screenSize.width * 0.7,
      itemHeight: screenSize.height * 0.5,
      layout: SwiperLayout.TINDER,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print("url: ${lista[index].getWebUrl()}");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TiendaScreen(tienda: lista[index])));
          },
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(20.0),
            // child: Image.network(
            //   "http://via.placeholder.com/350x150",
            //   fit: BoxFit.fill,
            // ),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/tienda.jpg'),
              image: NetworkImage(lista[index].getImgUrl()),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: lista.length,
      // pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    );
  }
}
