import 'dart:collection';

import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vagos_app/page/inicio.dart';
import 'package:vagos_app/page/mapa.dart';
import 'package:vagos_app/styles/my_icons.dart';

import '../entrar.dart';

class ExRoteiroPrincipal extends StatefulWidget {
  const ExRoteiroPrincipal({Key key}) : super(key: key);

  @override
  _ExRoteiroPrincipalState createState() => _ExRoteiroPrincipalState();
}

class _ExRoteiroPrincipalState extends State<ExRoteiroPrincipal> {

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
                //MAPA
                Container(
                  height: 350,
                  child: ClipShadow(
                    clipper: MyClipper(),
                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                        offset: Offset(5.5, 1.0))],
                    child: Container(
                      //color: Theme.of(context).primaryColor, //acaba por piscar preto na mesma
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(40.560912, -8.691978), //coordenadas de Vagos  (entre calvão e ponte de vagos)
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
                //DIAS
                Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      RaisedButton(
                        elevation: 2,
                        focusElevation: 4,
                        hoverElevation: 4,
                        highlightElevation: 8,
                        disabledElevation: 0,
                        onPressed: () {
                          //mostar o dia selecionado
                          //mudar de cor
                        },
                        shape: StadiumBorder(),
                        color: Theme.of(context).accentColor, // background
                        textColor: Colors.black, // foreground
                        child: Text('1º Dia', style: Theme.of(context).textTheme.subtitle1,),
                      ),

                      RaisedButton(
                        elevation: 2,
                        focusElevation: 4,
                        hoverElevation: 4,
                        highlightElevation: 8,
                        disabledElevation: 0,
                        onPressed: () {
                          //mostar o dia selecionado
                          //mudar de cor
                        },
                        shape: StadiumBorder(),
                        color: Colors.white, // background
                        textColor: Colors.black, // foreground
                        child: Text('2º Dia', style: Theme.of(context).textTheme.subtitle1,),
                      ),

                      RaisedButton(
                        elevation: 2,
                        focusElevation: 4,
                        hoverElevation: 4,
                        highlightElevation: 8,
                        disabledElevation: 0,
                        onPressed: () {
                          //mostar o dia selecionado
                          //mudar de cor
                        },
                        shape: StadiumBorder(),
                        color: Colors.white, // background
                        textColor: Colors.black, // foreground
                        child: Text('3º Dia', style: Theme.of(context).textTheme.subtitle1,),
                      ),



                    ],
                  ),
                ),
              ],
            ),

            Container(
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //MANHÃ
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.wb_sunny_rounded),
                          Text(
                            'Manhã',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.8,
                    ),
                    //CARTA
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        child: Stack(
                          alignment: Alignment.topRight, //posição do btn de remover
                          children: [
                            Container(
                              alignment: Alignment.centerRight, //posição do clip com a imagem
                              height: 150,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/imagens/religião_ctg.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.bottomLeft, //mover a imagem dentro do clip
                                          //scale: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'N.ª Sr.ª de Vagos',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_border_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: Text('4(120)', style: Theme.of(context).textTheme.caption,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.euro_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Gratuito', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Sempre', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                    //DIVIDER KM
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            thickness: 2,
                          ),
                          Text('    5.2 Km    ', style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.black54, backgroundColor: Theme.of(context).backgroundColor)),)
                        ],
                      ),
                    ),

                    //TARDE
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.wb_cloudy_rounded, color: Colors.white,),
                          Text(
                            'Tarde',
                            style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.8,
                    ),
                    //CARTA
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        child: Stack(
                          alignment: Alignment.topRight, //posição do btn de remover
                          children: [
                            Container(
                              alignment: Alignment.centerRight, //posição do clip com a imagem
                              height: 150,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/imagens/lazer_ctg.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.bottomRight, //mover a imagem dentro do clip
                                          //scale: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lagoa de Calvão',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_border_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: Text('4(120)', style: Theme.of(context).textTheme.caption,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.euro_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Gratuito', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Sempre', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                    //DIVIDER KM
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            thickness: 2,
                          ),
                          Text('    5.2 Km    ', style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.black54, backgroundColor: Theme.of(context).backgroundColor)),)
                        ],
                      ),
                    ),

                    //CARTA
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Card(
                        child: Stack(
                          alignment: Alignment.topRight, //posição do btn de remover
                          children: [
                            Container(
                              alignment: Alignment.centerRight, //posição do clip com a imagem
                              height: 150,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/imagens/praia_da_vagueira_barco.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.bottomRight, //mover a imagem dentro do clip
                                          //scale: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Praia da Vagueira',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_border_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: Text('4(120)', style: Theme.of(context).textTheme.caption,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.euro_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Gratuito', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Sempre', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                    //DIVIDER KM
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(
                            thickness: 2,
                          ),
                          Text('    5.2 Km    ', style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.black54, backgroundColor: Theme.of(context).backgroundColor)),)
                        ],
                      ),
                    ),


                    //NOITE
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        color: Theme.of(context).primaryColorDark,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.dark_mode_rounded, color: Colors.white,),
                          Text(
                            'Noite',
                            style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.8,
                    ),
                    //CARTA
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, bottom: 35),
                      child: Card(
                        child: Stack(
                          alignment: Alignment.topRight, //posição do btn de remover
                          children: [
                            Container(
                              alignment: Alignment.centerRight, //posição do clip com a imagem
                              height: 150,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/imagens/diversão_ctg.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.centerLeft, //mover a imagem dentro do clip
                                          //scale: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vagos Metal Fest',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Icon (Icons.star_border_rounded, size: 16, color: Theme.of(context).accentColor,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: Text('4(120)', style: Theme.of(context).textTheme.caption,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.euro_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('desde 42, 95', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Row(
                                      children: [
                                        Icon(Icons.schedule_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('Sempre', style: Theme.of(context).textTheme.subtitle1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
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


//FORMA DA ONDA PARA CARTAS!! >>>> nas cartas tem de ser diferente no ponto inicial, por causa de o conteudo não ficar muito à direita
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = new Path();

    //inicio e fim da altura
    path.lineTo(0, size.height);

    //primeira onda
    var firstStartPoint = Offset(size.width/3 - size.width/3, size.height - 60);
    var firstEndPoint = Offset(size.width/4 + size.width/8, size.height - 60); //mudar o 60 para mudar a altura do ponto
    path.quadraticBezierTo(firstStartPoint.dx, firstStartPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    //mete a forma do meio reta >>>> mudar estes valores se o dos outros dois pontos forem mudados
    var secStartPoint = Offset(size.width/4 - size.width/8, size.height - 60);
    var secEndPoint = Offset(size.width/2 + size.width/8, size.height - 60); //mudar o 60 para mudar a altura do ponto
    path.quadraticBezierTo(secStartPoint.dx, secStartPoint.dy, secEndPoint.dx, secEndPoint.dy);

    //ultima onda
    var endStartPoint = Offset(3*(size.width/4) + size.width/8, size.height - 60);
    var endEndPoint = Offset(size.width, size.height - 120); //mudar o 60 para mudar a altura do ponto
    path.quadraticBezierTo(endStartPoint.dx, endStartPoint.dy, endEndPoint.dx, endEndPoint.dy);

    //inicio e fim da largura
    path.lineTo(size.width,0);


    return path ;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}