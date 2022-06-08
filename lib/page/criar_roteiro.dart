import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/main.dart';
import 'package:vagos_app/page/criar_roteiro_publicar.dart';
import 'package:vagos_app/page/roteiros.dart';

import 'inicio.dart';

class CriarRoteiro extends StatefulWidget {
  const CriarRoteiro({Key key}) : super(key: key);

  @override
  _CriarRoteiroState createState() => _CriarRoteiroState();
}

class _CriarRoteiroState extends State<CriarRoteiro> {

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Criar Roteiro'),
            //Text('(1/2)', style: TextStyle(color: Colors.white.withOpacity(0.8))),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja sair?'),
                  content: const Text('Se sair agora, perderá tudo o que criou!'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement( //n está a fazer bem o replacement como está nos outros casos
                          context,
                          PageTransition(
                            type: PageTransitionType.scale,  //tbm n está a dar. n encontro a causa do problema
                            child: MyApp(),
                          ),
                        );
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.bottomCenter, child: CriarRoteiroPublicar()));

        },
        child: Icon(Icons.arrow_forward_rounded),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dias', style: Theme.of(context).textTheme.headline6,),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    /*Container(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: (){},
                          style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      //side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          child: Text('1', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.merge(TextStyle(fontFamily:'Krub'))),
                      ),
                    ),

                     */
                    //BTN N SELECIONADO
                    Stack(
                      alignment: const Alignment(2.0, -2.0),
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: RaisedButton(
                            textColor: Colors.black,
                            color: Colors.white,
                            child: Text('1', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.merge(TextStyle(fontFamily:'Krub', fontWeight: FontWeight.w600))),
                            onPressed: () {
                              //meter a selecionar e a ir para esse dia
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          child: ClipOval(
                            child: Material(
                              color: Theme.of(context).primaryColorDark, // button color
                              child: InkWell(
                                splashColor: Theme.of(context).accentColor, // inkwell color
                                child: SizedBox(
                                  width: 26,
                                  height: 26,
                                  child: Icon(
                                    Icons.remove_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                onTap: () {
                                  //meter a eliminar esse dia
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //BTN SELECIONADO
                    /*
                    Container(
                      height: 60,
                      width: 60,
                      child: OutlinedButton(
                        child: Text('1', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.merge(TextStyle(fontFamily:'Krub', fontWeight: FontWeight.w600))),
                        onPressed: () {
                          //meter a selecionar e a ir para esse dia
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Theme.of(context).primaryColor, width: 3),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    */
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Stack(
                        alignment: const Alignment(2.0, -2.0),
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            child: RaisedButton(
                              color: Theme.of(context).primaryColorLight,//Color(0xff8de3ff),
                              elevation: 8,
                              child: Text('2', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5.merge(TextStyle(fontFamily:'Krub', fontWeight: FontWeight.w600))),
                              onPressed: () {
                                //meter a selecionar e a ir para esse dia
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            child: ClipOval(
                              child: Material(
                                color: Theme.of(context).primaryColorDark, // button color
                                child: InkWell(
                                  splashColor: Theme.of(context).accentColor, // inkwell color
                                  child: SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Icon(
                                      Icons.remove_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  onTap: () {
                                    //meter a eliminar esse dia
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //BTN ADICIONAR DIA
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Container(
                        height: 60,
                        width: 60,
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: (){},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Icon(Icons.add_rounded, color: Theme.of(context).primaryColor,),
                        ),
                      ),
                    )
                  ],
                ),
              ),

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
                      IconButton(
                        icon: Icon(Icons.remove_circle_rounded),
                        color: Colors.white,
                        onPressed: (){
                          //meter a selecionar e a remover
                        },
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
              //BTN ADICIONAR
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: OutlineButton(
                  //splashColor: Theme.of(context).primaryColorLight,
                  child: Icon(Icons.add_rounded, color: Theme.of(context).primaryColor,),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column( //n meter wrap neste caso, para ele ficar automáticamente a meio e ver-se quando se procura
                                  children: [
                                    //BARRA DE PROCURA
                                    TextFormField(
                                      controller: _controller,
                                      cursorColor: Theme.of(context).primaryColor,
                                      //initialValue: 'Procurar destino',
                                      maxLength: 60,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.search_rounded),
                                        labelText: 'Procurar destino',
                                        //labelStyle: TextStyle(
                                          //color: Color(0xFF6200EE),
                                        //),
                                        //helperText: 'Helper text',
                                        suffixIcon: IconButton(
                                          onPressed: _controller.clear,
                                          icon: Icon(Icons.clear),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                        ),
                                      ),
                                    ),
                                    //CARTAS - RESULTADOS ---- AINDA A N DAR O RESULTADO CERTO
                                    //CADA UM DOS DESTINOS É SUPOSTO DAR PARA VISUALIZAR SE A PESSOA QUISER SEM ADICIONAR ESSE DESTINO, POR ISSO TEM UM ICONE DE ADICIONAR DE LADO
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
                                            IconButton(
                                              icon: Icon(Icons.add_circle_rounded),
                                              color: Colors.white,
                                              onPressed: (){
                                                //meter a selecionar e a remover
                                              },
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
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
                                            IconButton(
                                              icon: Icon(Icons.add_circle_rounded),
                                              color: Colors.white,
                                              onPressed: (){
                                                //meter a selecionar e a remover
                                              },
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
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
                                            IconButton(
                                              icon: Icon(Icons.add_circle_rounded),
                                              color: Colors.white,
                                              onPressed: (){
                                                //meter a selecionar e a remover
                                              },
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
                            ],
                          );
                    });
                  },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
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
                      IconButton(
                        icon: Icon(Icons.remove_circle_rounded),
                        color: Colors.white,
                        onPressed: (){
                          //meter a selecionar e a remover
                        },
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
              //BTN ADICIONAR
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: OutlineButton(
                  //splashColor: Theme.of(context).primaryColorLight,
                  child: Icon(Icons.add_rounded, color: Theme.of(context).primaryColor,),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column( //n meter wrap neste caso, para ele ficar automáticamente a meio e ver-se quando se procura
                                  children: [
                                    //BARRA DE PROCURA
                                    TextFormField(
                                      controller: _controller,
                                      cursorColor: Theme.of(context).primaryColor,
                                      //initialValue: 'Procurar destino',
                                      maxLength: 60,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.search_rounded),
                                        labelText: 'Procurar destino',
                                        //labelStyle: TextStyle(
                                        //color: Color(0xFF6200EE),
                                        //),
                                        //helperText: 'Helper text',
                                        suffixIcon: IconButton(
                                          onPressed: _controller.clear,
                                          icon: Icon(Icons.clear),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                        ),
                                      ),
                                    ),
                                    //CARTAS - RESULTADOS ---- AINDA A N DAR O RESULTADO CERTO
                                    //CADA UM DOS DESTINOS É SUPOSTO DAR PARA VISUALIZAR SE A PESSOA QUISER SEM ADICIONAR ESSE DESTINO, POR ISSO TEM UM ICONE DE ADICIONAR DE LADO
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
                                            IconButton(
                                              icon: Icon(Icons.add_circle_rounded),
                                              color: Colors.white,
                                              onPressed: (){
                                                //meter a selecionar e a remover
                                              },
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
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
                                            IconButton(
                                              icon: Icon(Icons.add_circle_rounded),
                                              color: Colors.white,
                                              onPressed: (){
                                                //meter a selecionar e a remover
                                              },
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
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
                                            IconButton(
                                              icon: Icon(Icons.add_circle_rounded),
                                              color: Colors.white,
                                              onPressed: (){
                                                //meter a selecionar e a remover
                                              },
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
                            ],
                          );
                        });
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
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
              //BTN ADICIONAR
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: OutlineButton(
                    //splashColor: Theme.of(context).primaryColorLight,
                    child: Icon(Icons.add_rounded, color: Theme.of(context).primaryColor,),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column( //n meter wrap neste caso, para ele ficar automáticamente a meio e ver-se quando se procura
                                    children: [
                                      //BARRA DE PROCURA
                                      TextFormField(
                                        controller: _controller,
                                        cursorColor: Theme.of(context).primaryColor,
                                        //initialValue: 'Procurar destino',
                                        maxLength: 60,
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.search_rounded),
                                          labelText: 'Procurar destino',
                                          //labelStyle: TextStyle(
                                          //color: Color(0xFF6200EE),
                                          //),
                                          //helperText: 'Helper text',
                                          suffixIcon: IconButton(
                                            onPressed: _controller.clear,
                                            icon: Icon(Icons.clear),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                          ),
                                        ),
                                      ),
                                      //CARTAS - RESULTADOS ---- AINDA A N DAR O RESULTADO CERTO
                                      //CADA UM DOS DESTINOS É SUPOSTO DAR PARA VISUALIZAR SE A PESSOA QUISER SEM ADICIONAR ESSE DESTINO, POR ISSO TEM UM ICONE DE ADICIONAR DE LADO
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
                                              IconButton(
                                                icon: Icon(Icons.add_circle_rounded),
                                                color: Colors.white,
                                                onPressed: (){
                                                  //meter a selecionar e a remover
                                                },
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
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
                                              IconButton(
                                                icon: Icon(Icons.add_circle_rounded),
                                                color: Colors.white,
                                                onPressed: (){
                                                  //meter a selecionar e a remover
                                                },
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
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
                                              IconButton(
                                                icon: Icon(Icons.add_circle_rounded),
                                                color: Colors.white,
                                                onPressed: (){
                                                  //meter a selecionar e a remover
                                                },
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
                              ],
                            );
                          });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
