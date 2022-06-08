import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vagos_app/page/mapa.dart';
import 'package:vagos_app/styles/my_icons.dart';

import '../entrar.dart';


class ExPercursoPrincipal extends StatefulWidget {
  const ExPercursoPrincipal({Key key}) : super(key: key);

  @override
  _ExPercursoPrincipalState createState() => _ExPercursoPrincipalState();
}

class _ExPercursoPrincipalState extends State<ExPercursoPrincipal> {

  //localizações
  Set<Marker> _markers = HashSet<Marker>();

  //zona
  Set<Polygon> _polygons = HashSet<Polygon>();

  //uma linha tipo percurso
  Set<Polyline> _polyLine = HashSet<Polyline>();

  //uma zona circular
  Set<Circle> _circles = HashSet<Circle>();



  GoogleMapController _mapController;


  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _setPolygons();
    _setPolyLines();
    _setCircles();
    _getLocationPermission();
  }

  //localização atual do user
  void _getLocationPermission() async {
    var location = new Location();
    try {
      location.requestPermission();
    } on Exception catch (_) {
      print('There was a problem allowing location access');
    }
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/icons/logo_30x30.png');

  }




  void _setPolygons() {
    List <LatLng> polygonLatLongs = List<LatLng>();
    polygonLatLongs.add(LatLng(40.48037745180676, -8.688028726979597));
    polygonLatLongs.add(LatLng(40.47510219481177, -8.696268473073347));
    polygonLatLongs.add(LatLng(40.47518054203166, -8.695410166188582));

    _polygons.add(
      Polygon(
        polygonId: PolygonId("0"),
        points: polygonLatLongs,
        strokeWidth: 1,
        fillColor: Colors.red,
      ),
    );
  }


  void _setPolyLines() {
    List <LatLng> polyLineLatLongs = List<LatLng>();
    polyLineLatLongs.add(LatLng(40.554758, -8.690305));
    polyLineLatLongs.add(LatLng(40.552810, -8.678640));
    polyLineLatLongs.add(LatLng(40.564872, -8.694229));
    polyLineLatLongs.add(LatLng(40.554111, -8.681121));
    polyLineLatLongs.add(LatLng(40.554758, -8.690305));

    _polyLine.add(
      Polyline(
        polylineId: PolylineId("0"),
        points: polyLineLatLongs,
        width: 4,
        color: Colors.blueAccent,
      ),
    );
  }


  void _setCircles() {
    _circles.add(
      Circle(
        circleId: CircleId("0"),
        center: LatLng(40.46943474909857, -8.704508219167097),
        radius: 1000,
        fillColor: Color.fromARGB(102, 51, 153, 5),
        strokeWidth: 2,
        strokeColor: Colors.amber,
      ),
    );
  }


  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("0"),
        position: LatLng(40.47834052017298, -8.69441452705904), //mudar dps para o que quero
        infoWindow: InfoWindow(
          title: "Rua das Almas, Calvão",
          snippet: "Minha Casa",
        ),
        icon: _markerIcon,
      ));
    });
  }





  //FOTOS DO PERCURSO
  int _current = 0;

  final List<String> imgList = [
    'assets/imagens/cultura_ctg.jpg',
    'assets/imagens/religião_ctg.jpg',
    'assets/imagens/vagos_percurso.jpg',
    'assets/imagens/eco_ctg.jpg',
    'assets/imagens/lazer_ctg.jpg',
  ];

  List<T> map<T> (List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //parte de cima
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      )
                  ),
                  height: 550,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40,330,40,16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(FontAwesomeIcons.route, size: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Text('8.3', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text('Km', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.schedule_rounded, size: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Text('1:34', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text('h', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.speed_rounded, size: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Text('8,3', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text('Km/h', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Rodrigo Campos', style: Theme.of(context).textTheme.bodyText2,),
                              Text('25 Abril, 2021 às 11:40h', style: Theme.of(context).textTheme.caption,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text('Comecei e terminei na minha casa, passando por pontos religiosos de Vagos.', style: Theme.of(context).textTheme.bodyText2,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    // METER A MUDAR DE COR FUTURAMENTE
                                  },
                                  icon: Icon(Icons.favorite_rounded, size: 18),
                                  label: Text("24"),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                          )
                                      )
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: OutlinedButton.icon(
                                    onPressed: () {
                                      // METER A MUDAR DE COR FUTURAMENTE
                                    },
                                    icon: Icon(Icons.share_rounded, size: 18),
                                    label: Text("4"),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                            )
                                        )
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //MAPA
                Container(
                  height: 350,
                  child: ClipShadow(
                    clipper: MyClipper(),
                    boxShadow: [BoxShadow(color: Theme.of(context).accentColor, blurRadius: 0, spreadRadius: 7,
                    offset: Offset(5.5, 1.0))],
                    child: Container(
                      //color: Theme.of(context).primaryColor, //acaba por piscar preto na mesma
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(40.554758, -8.690305), //coordenadas de Vagos  (entre calvão e ponte de vagos)
                          zoom: 13.5,
                        ),
                        markers: {
                            casa, capela2, santuario3, igreja4
                        },
                        //polygons: _polygons,
                        polylines: _polyLine,
                        //circles: _circles,
                        myLocationButtonEnabled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),


            //FOTOS DO PERCUSO
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Fotos do Percurso', style: Theme.of(context).textTheme.headline5,),
            ),
            //IMAGENS
            Container(
              //margin: EdgeInsets.only(bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    height: 200.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      reverse: false,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(microseconds: 2000),
                      pauseAutoPlayOnTouch: Duration(seconds: 8),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index){
                      setState(() {
                        _current = index;
                      });
                      },
                      items: imgList.map((imgUrl) {
                        return Builder(
                            builder: (BuildContext context){
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 10,),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Image.asset(imgUrl, fit: BoxFit.cover,),
                                ),
                              );
                            },
                        );
                      }).toList(),
                      //options: options
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(
                      imgList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index ? Theme.of(context).primaryColor: Colors.grey[400]),

                        );
                    }
                    ),
                  ),

                ],
              ),
            ),


            //PERCURSO
            Container(
              margin: EdgeInsets.only(top: 20,),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, -8), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(40.0),
                    topLeft: const Radius.circular(40.0),
                  )
              ),
              height: 570,
              width: MediaQuery.of(context).size.width * 1.0,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Percurso', style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.white)),),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(logo, height: 40, color: Colors.white,),
                              Text('Rua Santo Isidro, Calvão', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 12),
                            child: SizedBox(
                              height: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.radio_button_unchecked_rounded, color: Colors.white,
                                ),
                                Text('Capela de São Sebastião', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 12),
                            child: SizedBox(
                              height: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.radio_button_unchecked_rounded, color: Colors.white,
                                ),
                                Text('Santuário de Nª Srª de Vagos', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 12),
                            child: SizedBox(
                              height: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.radio_button_unchecked_rounded, color: Colors.white,
                                ),
                                Text('Igreja de S. Tiago', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)),),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 12),
                            child: SizedBox(
                              height: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal:4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset(logo, height: 40, color: Colors.white,),
                                Text('Rua Santo Isidro, Calvão', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),

    );
  }
}



Marker igreja4 = Marker(
    markerId: MarkerId('igreja4'),
    position: LatLng(40.554111, -8.681121),
    infoWindow: InfoWindow(
      title: 'Igreja de S. Tiago',
      //snippet: 'Ponto Religioso'
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    )
);

Marker santuario3 = Marker(
    markerId: MarkerId('santuario3'),
    position: LatLng(40.564872, -8.694229),
    infoWindow: InfoWindow(
      title: 'Santuário da Nª Srª de Vagos',
      //snippet: 'Ponto Religioso'
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    )
);

Marker capela2 = Marker(
    markerId: MarkerId('capela2'),
    position: LatLng(40.552810, -8.678640),
    infoWindow: InfoWindow(
      title: 'Capela de São Sebastião',
      //snippet: 'Ponto Religioso'
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    )
);

Marker casa = Marker(
    markerId: MarkerId('casa'),
  position: LatLng(40.554758, -8.690305),
  infoWindow: InfoWindow(
    title: 'Rua Santo Isidro, Calvão',
    snippet: 'Casa'
  ),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueYellow,
  )
);


