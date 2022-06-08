import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vagos_app/styles/my_icons.dart';

class Hoteis extends StatefulWidget {
  const Hoteis({Key key}) : super(key: key);

  @override
  _HoteisState createState() => _HoteisState();
}

class _HoteisState extends State<Hoteis> {
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
                //height: 569,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Bela Vagueira',
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
                            padding: EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start, //prefiro centrado no meio
                                    children: [
                                      SvgPicture.asset(logo, height: 24.0),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.7,
                                            child: Text('Praceta do Infante, Edifício MBJ4, 1ª Andar, Frente/Esq. 3840-273, Praia da Vagueira', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.euro_rounded),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text('desde 41', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                    ),
                                  ],
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                //height: 569,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Bela Vagueira',
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
                            padding: EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start, //prefiro centrado no meio
                                    children: [
                                      SvgPicture.asset(logo, height: 24.0),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.7,
                                            child: Text('Praceta do Infante, Edifício MBJ4, 1ª Andar, Frente/Esq. 3840-273, Praia da Vagueira', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.euro_rounded),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text('desde 41', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                    ),
                                  ],
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 85),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                //height: 569,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Bela Vagueira',
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
                            padding: EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start, //prefiro centrado no meio
                                    children: [
                                      SvgPicture.asset(logo, height: 24.0),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.7,
                                            child: Text('Praceta do Infante, Edifício MBJ4, 1ª Andar, Frente/Esq. 3840-273, Praia da Vagueira', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.euro_rounded),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text('desde 41', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                    ),
                                  ],
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