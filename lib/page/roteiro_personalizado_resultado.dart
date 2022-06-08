import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/page/ex_roteiro.dart';
import 'package:vagos_app/page/inicio.dart';
import 'package:vagos_app/styles/my_icons.dart';

import '../main.dart';


class RoteiroPersonalizadoResultado extends StatefulWidget {
  const RoteiroPersonalizadoResultado({Key key}) : super(key: key);

  @override
  _RoteiroPersonalizadoResultadoState createState() => _RoteiroPersonalizadoResultadoState();
}

class _RoteiroPersonalizadoResultadoState extends State<RoteiroPersonalizadoResultado> {

  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // meter a appBar atrás do conteudo
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja sair?'),
                  content: const Text('Se sair agora, perderá este resultado e terá de refazer todos os passos anteriores!'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.center, child: MyApp()));

                      },
                      child: const Text('Sair'),
                    ),
                  ],
                ),
              ),
              icon: Icon(Icons.close_rounded)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TITULO
            Container(
              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Text('Encontrámos o roteiro perfeito para ti!', style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: Colors.white,)),textAlign: TextAlign.center,),
              ),
            ),
            //BONECO CIMA ESQ
            Container(
              height: 45,
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
              padding: EdgeInsets.only(left: 35),
              alignment: Alignment.topLeft,
              //height: 50,
              child: SvgPicture.asset(
                  'assets/ilustracoes/boneco_cima_esq.svg'
              ),
            ),
            //CARTA 1
            InkWell(
              onTap: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.center, child: ExRoteiro()));

              },
              child: Transform.scale(
                scale: 0.95,
                child: Container(
                  transform: Matrix4.translationValues(0.0, -52.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                              transform: Matrix4.translationValues(25.0, -20.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
              ),
            ),
            //BONECOS BAIXO
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      child: SvgPicture.asset(
                          'assets/ilustracoes/boneco_baixo_esq.svg'
                      ),
                    ),
                    Container(
                      height: 45,
                      child: SvgPicture.asset(
                          'assets/ilustracoes/boneco_baixo_dir.svg'
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //OUTRAS POSSIBILIDADES
            Container(
              transform: Matrix4.translationValues(0.0, -75.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Outras possibilidades', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white,)),textAlign: TextAlign.center,),
              ),
            ),
            //ICON SETA BAIXO
            Container(
                transform: Matrix4.translationValues(0.0, -78.0, 0.0),
                child: Icon(Icons.expand_more_rounded, color: Colors.white,)),
            //CARTA 2
            Transform.scale(
              scale: 0.95,
              child: Container(
                transform: Matrix4.translationValues(0.0, -65.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                            transform: Matrix4.translationValues(25.0, -20.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
            ),
            //CARTA 3
            Transform.scale(
              scale: 0.95,
              child: Container(
                transform: Matrix4.translationValues(0.0, -75.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                            transform: Matrix4.translationValues(25.0, -20.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
            ),
            //AJUDE-NOS A MELHORAR
            Container(
              transform: Matrix4.translationValues(0.0, -70.0, 0.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: SvgPicture.asset(
                        'assets/ilustracoes/boneco_triste.svg'
                    ),
                  ),
                  Container(
                      transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                      child: Text('Nenhum dos resultados o agradou?', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Color(0xff2f2e41))),)),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: OutlineButton(
                      onPressed: () {
                        //meter a ir para uma página para o cliente explicar o pq de n o agradar e assim
                      },
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),
                        child: Text('AJUDE-NOS A MELHORAR!', style: Theme.of(context).textTheme.button.merge(TextStyle(color: Colors.white)),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
