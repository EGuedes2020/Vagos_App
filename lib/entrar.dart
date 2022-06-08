import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:page_transition/page_transition.dart';

import 'package:vagos_app/styles/my_icons.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

//import 'package:sign_button/sign_button.dart';


import 'main.dart';

class Entrar extends StatefulWidget {
  const Entrar({Key key}) : super(key: key);

  @override
  _EntrarState createState() => _EntrarState();
}


class _EntrarState extends State<Entrar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.85, 0.0),
                    image: AssetImage(
                      'assets/imagens/praia_da_vagueira_barco.jpg',
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.5),
                        ],
                        stops: [
                          0.7,
                          1.0
                        ])),
              )
            ]),
          ),
          ClipShadow(
            clipper: MyClipper(),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 30, spreadRadius: 10,
                offset: Offset(0.0, 1.0))],
            child: Container(
              height: 310,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          //LOGO
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: SvgPicture.asset(logo_letras_cores,),
          ),
          //TEXTO
          Padding(
            padding: const EdgeInsets.only(top: 290),
            child: Column(
              children: [
                Text('Bem-Vindo a Vagos!', style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: Colors.white)),),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text('Até onde queremos ir!', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                ),
              ],
            ),
          ),

          //BTNS ENTRAR

          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 660),
            child: Column(
              children: [
                SignInButton(
                  Buttons.FacebookNew,
                  text: "Entrar com o Facebook",
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    //meter a entrar pelo facebook
                    //por enquanto vai diretamente para a página inicio
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,  //tbm n está a dar. n encontro a causa do problema
                        child: MyApp(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SignInButton(
                    Buttons.Google,
                    text: "Entrar com o Google",
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,  //tbm n está a dar. n encontro a causa do problema
                          child: MyApp(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),


          /*
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 660),
            child: Column(
              children: [
                SignInButton(
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.medium, // small(default), medium, large
                    btnText: 'Entrar com Google',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,  //tbm n está a dar. n encontro a causa do problema
                          child: MyApp(),
                        ),
                      );
                    }),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SignInButton(
                      buttonType: ButtonType.facebook,
                      buttonSize: ButtonSize.medium,
                      btnText: 'Entrar com facebook',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,  //tbm n está a dar. n encontro a causa do problema
                            child: MyApp(),
                          ),
                        );
                      }),
                )

              ],
            ),
          ),
          */




        ],
      ),
    );
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


