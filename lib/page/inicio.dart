import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clip_shadow/clip_shadow.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/page/roteiro_personalizado.dart';
import 'package:vagos_app/styles/my_icons.dart';

import 'package:vagos_app/page/carta.dart';

import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'ex_roteiro.dart';

class Inicio extends StatefulWidget {
  const Inicio ({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  //para o ORDENAR por
  String valueChoose;
  List listItem = [
    "Recomendado", "Popular", "Classificação"
  ];



  RangeValues _rangeSliderDiscreteValues2 = const RangeValues(20, 100);


  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
        //elevation: 0,  // tirar isto se preferir com sombra
        actions: <Widget> [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //ENCONTRAR ROTEIRO PERSONALIZADO
            Stack(
              children: [
                ClipShadow(
                  clipper: MyClipper(),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 30, spreadRadius: 10,
                      offset: Offset(0.0, 1.0))],
                  child: Container(
                    height: 365,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(child:
                  Text('Encontra o roteiro perfeito para ti!',
                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white, fontSize: 22,)),
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                      child: Container(
                        height: 200,
                        child: SvgPicture.asset(
                            planear_locais_mundo,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Center(
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        highlightElevation: 15,
                        elevation: 10,
                        onPressed: (){
                          Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.center, child: RoteiroPersonalizado()));

                        },
                        child: Text('VAMOS', style: Theme.of(context).textTheme.button.merge(TextStyle(fontWeight: FontWeight.w600)),),
                    ),
                  ),
                ),
              ],
            ),


            //DESTINOS PRINCIPAIS
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Destinos Principais', style: Theme.of(context).textTheme.headline5.merge(TextStyle(letterSpacing: -0.5)),),
                  //meter "link" no de baixo
                  //Text('Ver mais', style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w500),),
                  TextButton(
                      onPressed: (){},//meter a ir para "ver mais" deste, caso o crie
                      child: Text('Ver mais', style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w500),),),
                ],
              ),
            ),
            //CARTAS DESTINOS
            Container(
              height: 340.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/praia_vagueira_pessoas.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomLeft,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 8.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                        width: 103,
                                        height: 36,
                                        child: OutlineButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          onPressed: () {}, //METER A IR PARA O MAPA!!!
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(logo_cores, height: 24,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Text('20 Km', style: Theme.of(context).textTheme.bodyText1,),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/religião_ctg.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 8.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                        width: 103,
                                        height: 36,
                                        child: OutlineButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          onPressed: () {}, //METER A IR PARA O MAPA!!!
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(logo_cores, height: 24,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Text('20 Km', style: Theme.of(context).textTheme.bodyText1,),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/praia_areao.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Praia do Areão',
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 8.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                        width: 103,
                                        height: 36,
                                        child: OutlineButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          onPressed: () {}, //METER A IR PARA O MAPA!!!
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(logo_cores, height: 24,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Text('20 Km', style: Theme.of(context).textTheme.bodyText1,),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/praia_labrego_pessoa_surf.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomRight,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Praia do Labrego',
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 8.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                        width: 103,
                                        height: 36,
                                        child: OutlineButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          onPressed: () {}, //METER A IR PARA O MAPA!!!
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(logo_cores, height: 24,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8),
                                                child: Text('20 Km', style: Theme.of(context).textTheme.bodyText1,),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    child: Card(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment(1.0, -1.23), //posição do icon
                            children: <Widget>[
                              ClipShadow(
                                clipper: MyClipperCards(),
                                boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                    offset: Offset(5.5, 1.0))],
                                child: Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/imagens/eco4.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomRight,
                                      //scale: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 180.0),
                                child: LikeButton(
                                  size: 80,
                                  circleColor:
                                  CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Theme.of(context).accentColor,
                                    dotSecondaryColor: Theme.of(context).primaryColor,
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.bookmark_rounded,
                                      color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                      size: 70,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quinta do Ega',
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
                                Container(
                                  transform: Matrix4.translationValues(0.0, 8.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: SizedBox(
                                      width: 103,
                                      height: 36,
                                      child: OutlineButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        onPressed: () {}, //METER A IR PARA O MAPA!!!
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(logo_cores, height: 24,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Text('20 Km', style: Theme.of(context).textTheme.bodyText1,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),



            //ROTEIROS POPULARES
            Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Roteiros Populares', style: Theme.of(context).textTheme.headline5.merge(TextStyle(letterSpacing: -0.5)),),
                  //meter "link" no de baixo
                  //Text('Ver mais', style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w500),),
                  TextButton(
                    onPressed: (){},//meter a ir para "ver mais" deste, caso o crie
                    child: Text('Ver mais', style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w500),),),
                ],
              ),
            ),
            //CARTAS ROTEIROS
            Container(
              height: 351.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.center, child: ExRoteiro()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        width: 280,
                        child: Card(
                          child: Column(
                            children: [
                              Stack(
                                alignment: const Alignment(1.0, -1.23), //posição do icon
                                children: <Widget>[
                                  ClipShadow(
                                    clipper: MyClipperCards(),
                                    boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                        offset: Offset(5.5, 1.0))],
                                    child: Container(
                                      height: 220,
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
                                  Container(
                                    margin: const EdgeInsets.only(left: 180.0),
                                    child: LikeButton(
                                      size: 80,
                                      circleColor:
                                      CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor: Theme.of(context).accentColor,
                                        dotSecondaryColor: Theme.of(context).primaryColor,
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.bookmark_rounded,
                                          color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                          size: 70,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Melhor de Vagos',
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
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                    ),
                                    Container(
                                      transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                                      child: Row(
                                        children: [
                                          ActionChip(
                                            avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                            label: Text(
                                              'Ecoturismo',
                                              style: Theme.of(context).textTheme.bodyText2,
                                            ),
                                            onPressed: () {}, //encontrar os roteiros dessa categoria
                                          ),

                                          /*
                                          Transform.scale(
                                              scale: 0.7,
                                            child: Container(
                                              margin: EdgeInsets.only(left: 16),
                                              height: 46,
                                              width: 46,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:  Colors.black54,
                                                  width: 2.0,
                                                ),
                                              ),

                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 23,
                                                child: IconButton(
                                                  icon: Icon(Icons.more_horiz_outlined),
                                                  color: Colors.black54,
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),

                                           */

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/praia_vagueira_pessoas.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomLeft,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Praias de Vagos',
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
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                  ),
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                                    child: ActionChip(
                                      avatar: Icon(Icons.beach_access_rounded, size: 20,),
                                      label: Text(
                                        'Praias',
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
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/cultura_ctg.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomLeft,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cultura de Vagos',
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
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                  ),
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 20.0, 0.0),
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
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/praia_labrego_pessoa_surf.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomRight,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ecoturismo Atividades',
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
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                  ),
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                                    child: ActionChip(
                                      avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                      label: Text(
                                        'Ecoturismo',
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
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    child: Card(
                      child: Column(
                        children: [
                          Stack(
                            alignment: const Alignment(1.0, -1.23), //posição do icon
                            children: <Widget>[
                              ClipShadow(
                                clipper: MyClipperCards(),
                                boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                    offset: Offset(5.5, 1.0))],
                                child: Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/imagens/eco6.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                      //scale: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 180.0),
                                child: LikeButton(
                                  size: 80,
                                  circleColor:
                                  CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Theme.of(context).accentColor,
                                    dotSecondaryColor: Theme.of(context).primaryColor,
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.bookmark_rounded,
                                      color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                      size: 70,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ecoturismo Percursos',
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
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text('Sara Palmela', style: Theme.of(context).textTheme.bodyText2,),
                                ),
                                Container(
                                  transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                                  child: ActionChip(
                                    avatar: Icon(FontAwesomeIcons.leaf, size: 20,),
                                    label: Text(
                                      'Ecoturismo',
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
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),




            //EVENTOS
            Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Eventos', style: Theme.of(context).textTheme.headline5.merge(TextStyle(letterSpacing: -0.5)),),
                  //meter "link" no de baixo
                  //Text('Ver mais', style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w500),),
                  TextButton(
                    onPressed: (){},//meter a ir para "ver mais" deste, caso o crie
                    child: Text('Ver mais', style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Ubuntu', fontSize: 17, fontWeight: FontWeight.w500),),),
                ],
              ),
            ),
            //CARTAS EVENTOS
            Container(
              height: 315.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/jogos_sem_fronteiras.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jogos Sem Fronteiras',
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon((Icons.event)),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('28 de Julho, 2021', style: Theme.of(context).textTheme.bodyText1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/imagens/25_abril.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '25 de Abril',
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon((Icons.event)),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('25 de Abril, 2021', style: Theme.of(context).textTheme.bodyText1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://www.cm-vagos.pt/thumbs/cmvagos/uploads/event/image/1121/cartaz_rali_bairrada_21_final_b_1_1024_2500.jpg'
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.bottomCenter,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rali da Bairrada',
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon((Icons.event)),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('29 a 30 de Maio, 2021', style: Theme.of(context).textTheme.bodyText1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 280,
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.23), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipperCards(),
                                  boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://www.cm-vagos.pt/thumbs/cmvagos/uploads/event/image/1128/exposicao_goncalo_fernandes_1_1024_2500.jpg'
                                        ),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        //scale: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 180.0),
                                  child: LikeButton(
                                    size: 80,
                                    circleColor:
                                    CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Theme.of(context).accentColor,
                                      dotSecondaryColor: Theme.of(context).primaryColor,
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.bookmark_rounded,
                                        color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                        size: 70,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Re(Criar)Te',
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
                                  Container(
                                    transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon((Icons.event)),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('3 a 30 de Julho, 2021', style: Theme.of(context).textTheme.bodyText1,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    child: Card(
                      child: Column(
                        children: [
                          Stack(
                            alignment: const Alignment(1.0, -1.23), //posição do icon
                            children: <Widget>[
                              ClipShadow(
                                clipper: MyClipperCards(),
                                boxShadow: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 0, spreadRadius: 7,
                                    offset: Offset(5.5, 1.0))],
                                child: Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://www.cm-vagos.pt/thumbs/cmvagos/uploads/event/image/1124/foto_2019_1_1024_2500.png'
                                      ),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter,
                                      //scale: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 180.0),
                                child: LikeButton(
                                  size: 80,
                                  circleColor:
                                  CircleColor(start: Theme.of(context).backgroundColor, end: Theme.of(context).accentColor),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Theme.of(context).accentColor,
                                    dotSecondaryColor: Theme.of(context).primaryColor,
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.bookmark_rounded,
                                      color: isLiked ? Theme.of(context).accentColor : Theme.of(context).backgroundColor,
                                      size: 70,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            transform: Matrix4.translationValues(25.0, -30.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Campeonato Bodysurf',
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
                                Container(
                                  transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon((Icons.event)),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('6de Junho, 2021', style: Theme.of(context).textTheme.bodyText1,),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
            ),




            //FOTOS DE VAGOS
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Fotos de Vagos', style: Theme.of(context).textTheme.headline5.merge(TextStyle(letterSpacing: -0.5)),))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                      child: Card(
                        child: Image.asset('assets/imagens/praia_da_vagueira_barco.jpg'),
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                  )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Card(
                                child:  Image.asset('assets/imagens/cultura_ctg.jpg'),
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                              Expanded(child: Card(
                                child:  Image.asset('assets/imagens/diversão_ctg.jpg'),
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Card(
                                child:  Image.asset('assets/imagens/praia_labrego_pessoa_surf.jpg'),
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                              Expanded(child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Card(
                                    child: Image.asset('assets/imagens/lazer_ctg.jpg', color: Theme.of(context).primaryColor.withOpacity(0.76),colorBlendMode: BlendMode.srcOver,),
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Icon(
                                      Icons.add_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                  )],
              ),
            ),



            //POSTO DE TURISMO
            Container(
              margin: EdgeInsets.only(top: 35, bottom: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text('Posto de Turismo', style: Theme.of(context).textTheme.headline5,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Icon(Icons.phone),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('924 463 250', style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16)),),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.watch_later_rounded),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text('Sazonal', style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16)),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                SvgPicture.asset(logo, height: 24.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('Largo Parracho Branco', style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16)),),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.alternate_email_rounded),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text('turismo@cm-vagos.pt', style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 16)),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    height: 240,
                      child: SvgPicture.asset('assets/ilustracoes/posto_turismo_undraw.svg'),
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



//PROCURAR
class DataSearch extends SearchDelegate<String> {

  String get searchFieldLabel => "Procurar";

  final tudo = [
    "Melhor de Vagos",
    "Praia da Vagueira",
    "Biblioteca",
    "Campismo",
    "Vagos Metal Fest",
    "@antoniovieira"
  ];

  final recentTudo = [
    "Melhor de Vagos",
    "Praia da Vagueira",
    "@antoniovieira"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), onPressed: () {
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      child: Card(
        color: Colors.blue,
        child: Center(
          child: Text(query), //vai dar o resultado da procura TIRAR DPS!!!!!
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentTudo:tudo.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      onTap: (){
        showResults(context);
      },
      leading: Icon(Icons.history),
      title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          children: [TextSpan(
              text:  suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          )]
      ),),
    ),
      itemCount: suggestionList.length,
    );
  }
}





