import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/page/ex_percurso.dart';
import 'package:vagos_app/styles/my_icons.dart';
import 'package:vagos_app/tabs/ex_percurso_principal.dart';

class Percursos extends StatefulWidget {
  const Percursos({Key key}) : super(key: key);

  @override
  _PercursosState createState() => _PercursosState();
}

class _PercursosState extends State<Percursos> {

  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                      transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Trilho da Lontra',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Icon(Icons.verified_rounded, color: Theme.of(context).primaryColor,),
                              ),
                            ],
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
                                Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new AssetImage(
                                                'assets/imagens/mapa_circulo.png')
                                        )
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,bottom: 6),
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
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ExPercurso(),
                ),
              );
            },
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
                        transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ExPercurso(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
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
                        transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
    );
  }
}





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