import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:clip_shadow/clip_shadow.dart';

import 'package:vagos_app/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sticky_headers/sticky_headers.dart';


var scaffoldKey = GlobalKey<ScaffoldState>(); //para mudar o icon do drawer

class PerfilOutro extends StatefulWidget {
  const PerfilOutro({Key key}) : super(key: key);

  @override
  _PerfilOutroState createState() => _PerfilOutroState();
}

class _PerfilOutroState extends State<PerfilOutro> {


  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);


  //RADIO
  int selectedRadio;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
           key: scaffoldKey, //para mudar o icon do drawer
        appBar: AppBar(
          title: Text('Perfil'),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.chat_rounded),
                    title: Text('Enviar Mensagem'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.share_rounded),
                    title: Text('Partilhar'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.flag_rounded),
                    title: Text('Reportar'),
                  ),
                ),
              ],
            )
          ],
        ),
        




        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipShadow(
                      clipper: MyClipper(),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 30, spreadRadius: 10,
                          offset: Offset(0.0, 1.0))],
                      child: Container(
                        height: 425,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ClipShadow(
                      clipper: MyClipper(),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 30, spreadRadius: 10,
                          offset: Offset(0.0, 1.0))],
                      child: Container(
                        height: 330,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/imagens/perfil_sara_palmela.jpg',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              radius: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Sara Palmela', style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.white)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('@sarapalmela', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white.withOpacity(0.76))),),
                          ),
                          
                          //BTN SEGUIR
                          Padding(
                            padding: const EdgeInsets.only(top:12.0),
                            child: ElevatedButton.icon(
                                 icon: Icon(Icons.person_add, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Theme.of(context).primaryColorLight,
                                ),
                              label: Text('Seguir', style: TextStyle(color: Colors.black)),
                              onPressed: () {},
                            ),
                          ),
                          
                          //INFO SEGUIDORES 
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text('24', style: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),),
                                      ),
                                      Text('Seguidores', style: Theme.of(context).textTheme.subtitle1,),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text('2', style: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor)),),
                                      ),
                                      Text('Roteiros', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Theme.of(context).primaryColor)),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text('16', style: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),),
                                      ),
                                      Text('A Seguir', style: Theme.of(context).textTheme.subtitle1,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //TABS NO BODY
              Container(
                transform: Matrix4.translationValues(0.0, -45.0, 0.0),
                height: 644, //altura da bassa das tabs para n desaparecer
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.grey[500],
                            indicatorColor: Theme.of(context).primaryColor,
                            indicatorWeight: 2.0,
                            tabs: [
                              Tab(text: 'ROTEIROS', icon: Icon(Icons.tour_rounded),),
                              Tab(text: 'PERCURSOS', icon: CustomIcon('assets/icons/logo_cores_24x24.png'),),
                            ],
                          ),
                        ),

                        //CONTEUDO DAS TABS
                        Container(
                            height: 570, //height of TabBarView
                            child: TabBarView(children: <Widget>[

                              
                              //Roteiros
                              ListView(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 549,
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: const Alignment(1.0, -1.21), //posição do icon
                                                children: <Widget>[
                                                  ClipShadow(
                                                    clipper: MyClipper(),
                                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                                        offset: Offset(5.5, 1.0))],
                                                    child: Container(
                                                      height: 270,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/imagens/eco_ctg.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment.bottomCenter,
                                                          //scale: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      icon: const Icon(
                                                        Icons.bookmark_rounded,
                                                      ),
                                                      color: _saveColor2,
                                                      iconSize: 70,
                                                      onPressed: (){
                                                        setState(() {
                                                          if(_saveColor2 == Color(0xfffafafa)) {
                                                            _saveColor2 = Color(0xffFFD400);
                                                          }else{
                                                            _saveColor2 = Color(0xfffafafa);
                                                          }
                                                        });
                                                      }),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -21.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Melhor de Vagos',
                                                      style: Theme.of(context).textTheme.headline5,
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
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25,),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Icon (Icons.date_range_rounded, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 8),
                                                                child: Text('3 Dias', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400)),),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 60),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                Icon (Icons.euro_rounded, size: 30,),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 8),
                                                                  child: Text('desde 150', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400)),),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Wrap(
                                                  children: [
                                                    ActionChip(
                                                      avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                                      label: Text(
                                                        'Ecoturismo',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                      child: ActionChip(
                                                        avatar: Icon(Icons.hotel_rounded,),
                                                        label: Text(
                                                          'Estadia',
                                                          style: Theme.of(context).textTheme.bodyText2,
                                                        ),
                                                        onPressed: () {}, //encontrar os roteiros dessa categoria
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.beach_access_rounded,),
                                                      label: Text(
                                                        'Praias',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.museum_rounded,),
                                                      label: Text(
                                                        'Cultura',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(FontAwesomeIcons.cross, size: 20,),
                                                      label: Text(
                                                        'Religião',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.attractions,),
                                                      label: Text(
                                                        'Diversão',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.nature_people_rounded,),
                                                      label: Text(
                                                        'Lazer',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 549,
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: const Alignment(1.0, -1.21), //posição do icon
                                                children: <Widget>[
                                                  ClipShadow(
                                                    clipper: MyClipper(),
                                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                                        offset: Offset(5.5, 1.0))],
                                                    child: Container(
                                                      height: 270,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/imagens/eco_ctg.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment.bottomCenter,
                                                          //scale: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      icon: const Icon(
                                                        Icons.bookmark_rounded,
                                                      ),
                                                      color: _saveColor2,
                                                      iconSize: 70,
                                                      onPressed: (){
                                                        setState(() {
                                                          if(_saveColor2 == Color(0xfffafafa)) {
                                                            _saveColor2 = Color(0xffFFD400);
                                                          }else{
                                                            _saveColor2 = Color(0xfffafafa);
                                                          }
                                                        });
                                                      }),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -21.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Melhor de Vagos',
                                                      style: Theme.of(context).textTheme.headline5,
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
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25,),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Icon (Icons.date_range_rounded, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 8),
                                                                child: Text('3 Dias', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400)),),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 60),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                Icon (Icons.euro_rounded, size: 30,),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 8),
                                                                  child: Text('desde 150', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400)),),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Wrap(
                                                  children: [
                                                    ActionChip(
                                                      avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                                      label: Text(
                                                        'Ecoturismo',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                      child: ActionChip(
                                                        avatar: Icon(Icons.hotel_rounded,),
                                                        label: Text(
                                                          'Estadia',
                                                          style: Theme.of(context).textTheme.bodyText2,
                                                        ),
                                                        onPressed: () {}, //encontrar os roteiros dessa categoria
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.beach_access_rounded,),
                                                      label: Text(
                                                        'Praias',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.museum_rounded,),
                                                      label: Text(
                                                        'Cultura',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(FontAwesomeIcons.cross, size: 20,),
                                                      label: Text(
                                                        'Religião',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.attractions,),
                                                      label: Text(
                                                        'Diversão',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.nature_people_rounded,),
                                                      label: Text(
                                                        'Lazer',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 549,
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: const Alignment(1.0, -1.21), //posição do icon
                                                children: <Widget>[
                                                  ClipShadow(
                                                    clipper: MyClipper(),
                                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                                        offset: Offset(5.5, 1.0))],
                                                    child: Container(
                                                      height: 270,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/imagens/eco_ctg.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment.bottomCenter,
                                                          //scale: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      icon: const Icon(
                                                        Icons.bookmark_rounded,
                                                      ),
                                                      color: _saveColor2,
                                                      iconSize: 70,
                                                      onPressed: (){
                                                        setState(() {
                                                          if(_saveColor2 == Color(0xfffafafa)) {
                                                            _saveColor2 = Color(0xffFFD400);
                                                          }else{
                                                            _saveColor2 = Color(0xfffafafa);
                                                          }
                                                        });
                                                      }),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -21.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Melhor de Vagos',
                                                      style: Theme.of(context).textTheme.headline5,
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
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25,),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Icon (Icons.date_range_rounded, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 8),
                                                                child: Text('3 Dias', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400)),),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 60),
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
                                                                Icon (Icons.euro_rounded, size: 30,),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 8),
                                                                  child: Text('desde 150', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400)),),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Wrap(
                                                  children: [
                                                    ActionChip(
                                                      avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                                      label: Text(
                                                        'Ecoturismo',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                      child: ActionChip(
                                                        avatar: Icon(Icons.hotel_rounded,),
                                                        label: Text(
                                                          'Estadia',
                                                          style: Theme.of(context).textTheme.bodyText2,
                                                        ),
                                                        onPressed: () {}, //encontrar os roteiros dessa categoria
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.beach_access_rounded,),
                                                      label: Text(
                                                        'Praias',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.museum_rounded,),
                                                      label: Text(
                                                        'Cultura',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(FontAwesomeIcons.cross, size: 20,),
                                                      label: Text(
                                                        'Religião',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.attractions,),
                                                      label: Text(
                                                        'Diversão',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8),                    child: ActionChip(
                                                      avatar: Icon(Icons.nature_people_rounded,),
                                                      label: Text(
                                                        'Lazer',
                                                        style: Theme.of(context).textTheme.bodyText2,
                                                      ),
                                                      onPressed: () {}, //encontrar os roteiros dessa categoria
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              //PERCURSOS
                              ListView(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          //height: 465, //este n tem o probema das cartas que têm chips
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: const Alignment(1.0, -1.21), //posição do icon
                                                children: <Widget>[
                                                  ClipShadow(
                                                    clipper: MyClipper(),
                                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                                        offset: Offset(5.5, 1.0))],
                                                    child: Container(
                                                      height: 270,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/imagens/eco_ctg.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment.bottomCenter,
                                                          //scale: 2,
                                                        ),
                                                      ),
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
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Pontos Religiosos de Vagos',
                                                      style: Theme.of(context).textTheme.headline5,
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
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text('Rodrigo Campos', style: Theme.of(context).textTheme.bodyText2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 4),
                                                      child: Text('25 Abril, 2021 às 11:40h', style: Theme.of(context).textTheme.caption,),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 35, right: 60, left: 10),
                                                      child: Row(
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
                                                child: Text('Comecei e terminei na minha casa, passando por pontos de religiosos de Vagos.', style: Theme.of(context).textTheme.bodyText2,),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25,bottom: 6, top: 16),
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
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          //height: 465, //este n tem o probema das cartas que têm chips
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: const Alignment(1.0, -1.21), //posição do icon
                                                children: <Widget>[
                                                  ClipShadow(
                                                    clipper: MyClipper(),
                                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                                        offset: Offset(5.5, 1.0))],
                                                    child: Container(
                                                      height: 270,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/imagens/eco_ctg.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment.bottomCenter,
                                                          //scale: 2,
                                                        ),
                                                      ),
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
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Pontos Religiosos de Vagos',
                                                      style: Theme.of(context).textTheme.headline5,
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
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text('Rodrigo Campos', style: Theme.of(context).textTheme.bodyText2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 4),
                                                      child: Text('25 Abril, 2021 às 11:40h', style: Theme.of(context).textTheme.caption,),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 35, right: 60, left: 10),
                                                      child: Row(
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
                                                child: Text('Comecei e terminei na minha casa, passando por pontos de religiosos de Vagos.', style: Theme.of(context).textTheme.bodyText2,),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25,bottom: 6, top: 16),
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
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          //height: 465, //este n tem o probema das cartas que têm chips
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: const Alignment(1.0, -1.21), //posição do icon
                                                children: <Widget>[
                                                  ClipShadow(
                                                    clipper: MyClipper(),
                                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                                        offset: Offset(5.5, 1.0))],
                                                    child: Container(
                                                      height: 270,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/imagens/eco_ctg.jpg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment.bottomCenter,
                                                          //scale: 2,
                                                        ),
                                                      ),
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
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Pontos Religiosos de Vagos',
                                                      style: Theme.of(context).textTheme.headline5,
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
                                                      padding: const EdgeInsets.only(top: 12),
                                                      child: Text('Rodrigo Campos', style: Theme.of(context).textTheme.bodyText2,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 4),
                                                      child: Text('25 Abril, 2021 às 11:40h', style: Theme.of(context).textTheme.caption,),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 35, right: 60, left: 10),
                                                      child: Row(
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
                                                child: Text('Comecei e terminei na minha casa, passando por pontos de religiosos de Vagos.', style: Theme.of(context).textTheme.bodyText2,),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25,bottom: 6, top: 16),
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
                                    ),
                                  ),
                                ],
                              ),



                            ])
                        )
                      ])
                  ),
                ]),
              ),





            ],
          ),
        ),
      ),
    );
  }
}




//para fazer o icon logo mudar de cor --- foi necessário ser png por causa do CustomIcon
class CustomIcon extends StatelessWidget{
  const CustomIcon(this.name, { Key key, this.size, this.color, }) : super(key: key);

  final String name;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {

    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconOpacity = iconTheme.opacity;
    Color iconColor = color ?? iconTheme.color;

    if (iconOpacity != 1.0) iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
    return Image.asset(name, color: iconColor, height: size,);
  }
}





//FORMA DA ONDA PRINCIPAL
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = new Path();

    //inicio e fim da altura
    path.lineTo(0, size.height);

    //primeira onda
    var firstStartPoint = Offset(size.width/4 - size.width/8, size.height - 60);
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




//FORMA DA ONDA PARA CARTAS!! >>>> nas cartas tem de ser diferente no ponto inicial, por causa de o conteudo não ficar muito à direita
class MyClipperCards extends CustomClipper<Path>{
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
