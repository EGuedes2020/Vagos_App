import 'dart:collection';

import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:like_button/like_button.dart';

import 'package:location/location.dart';
import 'package:vagos_app/data/chips.dart';
import 'package:vagos_app/model/chips.dart';
import 'package:vagos_app/styles/my_icons.dart';

import 'descobrir/diversao.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.white,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

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
    _markerIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/icons/logo_200x200.png',);

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
    polyLineLatLongs.add(LatLng(40.46943474909857, -8.704508219167097));
    polyLineLatLongs.add(LatLng(40.471785360176916, -8.695925150319441));
    polyLineLatLongs.add(LatLng(40.4738747231728, -8.68871537248741));

    _polyLine.add(
        Polyline(
          polylineId: PolylineId("0"),
          points: polyLineLatLongs,
          width: 1,
          color: Colors.purple,
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
        onTap: (){
          controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  target: LatLng(40.565098, -8.768250), zoom: 18)));
          showModalBottomSheet(
              context: context,
              builder: (builder) {
                return Container(
                  color: Colors.transparent,
                  child: Wrap(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /*
                          ListTile(
                            title: Text(
                              'Praia da Vagueira',
                              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontSize: 18))
                                  .copyWith(color: Colors.white),
                            ),
                            tileColor: Theme.of(context).primaryColor,
                          ),

                           */


                          Stack(children: <Widget>[
                            ClipShadow(
                              clipper: MyClipperCards(),
                              boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 5,
                                  offset: Offset(5.5, 5.0))],
                              child: Container(
                                height: 260.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    alignment: const Alignment(-1.0, 0.0),
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/imagens/praia_vagueira_pessoas.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            ClipPath(
                              clipper: MyClipperCards(),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Praia da Vagueira', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text('Praia mais famosa de Vagos', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)),),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height: 260.0,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [

                                          Colors.black.withOpacity(0.20),
                                          Colors.black.withOpacity(0.0),
                                        ],
                                        stops: [
                                          0.1,
                                          0.3,
                                        ])),
                              ),
                            )

                          ]),


                          Container(
                            transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                            height: 100,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Flexible(
                              child: RichText(
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: 'A Praia da Vagueira é a praia mais popular de toda a região. Com um areal extenso e o paredão que convida a longos passeios com vista para o mar, é pela pesca com Arte Xávega que esta praia se distingue de todas as outras. Venha testemunhar a mais antiga forma de pesca no mundo, na qual pequenos barcos enfrentam as ondas da rebentação para largar as redes; e onde pode ajudar os pescadores locais a puxar as redes de volta a terra, com a ajuda de bois ou tratores. Uma tradição que não pode perder.'),
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 25),
                            transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ActionChip(
                                  avatar: Icon(Icons.beach_access_rounded, size: 20,),
                                  label: Text(
                                    'Praias',
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onPressed: () {}, //encontrar os roteiros dessa categoria
                                ),



                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ActionChip(
                                    avatar: Icon(Icons.attractions_rounded, size: 20,),
                                    label: Text(
                                      'Diversão',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: ActionChip(
                                    avatar: Icon(Icons.museum_rounded, size: 20,),
                                    label: Text(
                                      'Cultura',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    //dar as direções da posição atual até à prevista
                                  },
                                  label: Text('Direções'),
                                  icon: Icon(Icons.directions),
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                    primary: Theme.of(context).primaryColor,
                                  ),
                                ),

                                OutlinedButton.icon(
                                  onPressed: () {
                                    //meter a guardar
                                  },
                                  label: Text('Guardar'),
                                  icon: Icon(Icons.bookmark_border_rounded),
                                  style: OutlinedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    shape: StadiumBorder(),
                                  ),
                                ),

                                OutlinedButton.icon(
                                  onPressed: () {
                                    //meter a guardar
                                  },
                                  label: Text('Partilhar'),
                                  icon: Icon(Icons.share_rounded),
                                  style: OutlinedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    shape: StadiumBorder(),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),




                    ],
                  ),
                );
              });
        },
        markerId: MarkerId("0"),
        position: LatLng(40.565098, -8.768250), //mudar dps para o que quero
        infoWindow: InfoWindow(
          title: "Praia da Vagueira",
          snippet: "Praia mais famosa de Vagos",
        ),
        icon: _markerIcon,
      ));
    });

  }





  //para as CHIPS do filtro
  int index = 4;
  final double spacing = 8;

  List<FilterChipData> filterChips = FilterChips.all;


  Widget _buildChips() => Wrap(
    runSpacing: spacing/10,
    spacing: spacing,
    children: filterChips
        .map((filterChip) => FilterChip(
      avatar: Icon(
        filterChip.icon,
        color: filterChip.iconColor,
        size: 24.0,
      ),
      label: Text(filterChip.label),
      labelStyle: TextStyle(
        fontFamily: 'Krub',
        fontSize:  14.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.6,
        color: Colors.black,//filterChip.color,
      ),
      backgroundColor: filterChip.color.withOpacity(0.1), //cor chip n selecionada
      onSelected: (isSelected) => setState(() {
        filterChips = filterChips.map((otherChip) {
          return filterChip == otherChip
              ? otherChip.copy(isSelected: isSelected)
              : otherChip;
        }).toList();
      }),
      selected: filterChip.isSelected,
      elevation: 4,
      checkmarkColor: Colors.white,
      selectedColor: filterChip.color.withOpacity(0.35),  //cor chip selecionada
    ))
        .toList(),
  );





  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);



  //PRINCIPAL
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        alignment: Alignment.topCenter, //mexe o container de cima

        children: <Widget>[
          GoogleMap(
            zoomGesturesEnabled: true,
            onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(40.565098, -8.768250), //coordenadas de Vagos  (entre calvão e ponte de vagos)
                zoom: 11.5,
              ),
              markers: _markers,
              //polygons: _polygons,
              //polylines: _polyLine,
              //circles: _circles,
              myLocationButtonEnabled: true,
          ),





          Padding(
            padding: const EdgeInsets.only(top: 65.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2, // 60% of space => (6/(6 + 4))
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 23,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_rounded),
                        color: Colors.grey,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),


                Expanded(
                  flex: 8, // 40% of space
                  child: Container(
                    margin: EdgeInsets.only(right: 16, left: 16),
                    height: 46,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            icon: Icon(Icons.search_rounded,),
                            contentPadding:
                            EdgeInsets.only(left: 0, bottom: 11, top: 11, right: 15),
                            hintText: "Até onde queres ir?"),
                      ),
                    ),
                    //child: ...
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child:  _buildChips(),
          ),


          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 163.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    width: 350.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0,),
                      child: Card(
                        child: Stack(
                          alignment: const Alignment(1.0, -1.55), //posição do icon
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
                                            'assets/imagens/eco_ctg.jpg',
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
                                    padding: const EdgeInsets.only(top: 9),
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
                                    padding: const EdgeInsets.only(top: 4),
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


                                  ActionChip(
                                    avatar: Icon(Icons.beach_access_rounded, size: 20,),
                                    label: Text(
                                      'Praias',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.bookmark_rounded,
                                ),
                                color: _saveColor,
                                iconSize: 70,
                                onPressed: (){
                                  setState(() {
                                    if(_saveColor == Color(0xfffafafa)) {
                                      _saveColor = Color(0xffFFD400);
                                    }else{
                                      _saveColor = Color(0xfffafafa);
                                    }
                                  });
                                }),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                  ),
                  Container(
                    width: 350.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        child: Stack(
                          alignment: const Alignment(1.0, -1.55), //posição do icon
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
                                            'assets/imagens/eco_ctg.jpg',
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
                                    padding: const EdgeInsets.only(top: 9),
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
                                    padding: const EdgeInsets.only(top: 4),
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


                                  ActionChip(
                                    avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                    label: Text(
                                      'Ecoturismo',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.bookmark_rounded,
                                ),
                                color: _saveColor,
                                iconSize: 70,
                                onPressed: (){
                                  setState(() {
                                    if(_saveColor == Color(0xfffafafa)) {
                                      _saveColor = Color(0xffFFD400);
                                    }else{
                                      _saveColor = Color(0xfffafafa);
                                    }
                                  });
                                }),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                  ),
                  Container(
                    width: 350.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        child: Stack(
                          alignment: const Alignment(1.0, -1.55), //posição do icon
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
                                            'assets/imagens/eco_ctg.jpg',
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
                                    padding: const EdgeInsets.only(top: 9),
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
                                    padding: const EdgeInsets.only(top: 4),
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


                                  ActionChip(
                                    avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                    label: Text(
                                      'Ecoturismo',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.bookmark_rounded,
                                ),
                                color: _saveColor,
                                iconSize: 70,
                                onPressed: (){
                                  setState(() {
                                    if(_saveColor == Color(0xfffafafa)) {
                                      _saveColor = Color(0xffFFD400);
                                    }else{
                                      _saveColor = Color(0xfffafafa);
                                    }
                                  });
                                }),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                  ),
                  Container(
                    width: 350.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        child: Stack(
                          alignment: const Alignment(1.0, -1.55), //posição do icon
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
                                            'assets/imagens/eco_ctg.jpg',
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
                                    padding: const EdgeInsets.only(top: 9),
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
                                    padding: const EdgeInsets.only(top: 4),
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


                                  ActionChip(
                                    avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                    label: Text(
                                      'Ecoturismo',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.bookmark_rounded,
                                ),
                                color: _saveColor,
                                iconSize: 70,
                                onPressed: (){
                                  setState(() {
                                    if(_saveColor == Color(0xfffafafa)) {
                                      _saveColor = Color(0xffFFD400);
                                    }else{
                                      _saveColor = Color(0xfffafafa);
                                    }
                                  });
                                }),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 350.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Card(
                        child: Stack(
                          alignment: const Alignment(1.0, -1.55), //posição do icon
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
                                            'assets/imagens/eco_ctg.jpg',
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
                                    padding: const EdgeInsets.only(top: 9),
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
                                    padding: const EdgeInsets.only(top: 4),
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


                                  ActionChip(
                                    avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                    label: Text(
                                      'Ecoturismo',
                                      style: Theme.of(context).textTheme.bodyText2,
                                    ),
                                    onPressed: () {}, //encontrar os roteiros dessa categoria
                                  ),

                                ],
                              ),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.bookmark_rounded,
                                ),
                                color: _saveColor,
                                iconSize: 70,
                                onPressed: (){
                                  setState(() {
                                    if(_saveColor == Color(0xfffafafa)) {
                                      _saveColor = Color(0xffFFD400);
                                    }else{
                                      _saveColor = Color(0xfffafafa);
                                    }
                                  });
                                }),
                          ],
                        ),
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),


        ],
      ),


    );
  }


}







