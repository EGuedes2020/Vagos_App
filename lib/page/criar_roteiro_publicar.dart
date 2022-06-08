import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/data/chips.dart';
import 'package:vagos_app/model/chips.dart';
import 'package:vagos_app/page/mapa.dart';
import 'package:vagos_app/page/perfil.dart';
import 'package:vagos_app/page/roteiros.dart';

import 'inicio.dart';

class CriarRoteiroPublicar extends StatefulWidget {
  const CriarRoteiroPublicar({Key key}) : super(key: key);

  @override
  _CriarRoteiroPublicarState createState() => _CriarRoteiroPublicarState();
}

class _CriarRoteiroPublicarState extends State<CriarRoteiroPublicar> {

  //para as CHIPS do filtro
  int index = 4;
  final double spacing = 8;

  List<FilterChipData> filterChips = FilterChips.all;


  Widget _buildChips() => Wrap(
    runSpacing: spacing,
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
      checkmarkColor: Colors.white,
      selectedColor: filterChip.color.withOpacity(0.35),  //cor chip selecionada
    ))
        .toList(),
  );

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
                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.center, child: MyApp()));
                        //ESTÁ SUPER ERRADO E DÁ EERO MAS N CONSIGO RESOLVER DE MANEIRA NENHUMA!!!!!!!!!!!!!!!!!!
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        //icon: Icon(Icons.share_rounded),
        label: Text('PUBLICAR'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Título do Roteiro",
                style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  maxLength: 60,
                  //initialValue: 'Input text',
                  decoration: InputDecoration(
                    hintText: 'Ex: Melhor de Vagos',
                    //labelText: 'Título do Roteiro',
                    //errorText: 'Error message',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Orçamento Mínimo",
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[\\-|+*/.\\ ]'))],
                  maxLength: 10,
                  //initialValue: 'Input text',
                  decoration: InputDecoration(
                    //labelText: 'Ex: "15,50"',
                    //errorText: 'Error message',
                    hintText: "Ex: 15,50",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    suffixIcon: Icon(
                      Icons.euro_rounded,
                    ),
                  ),
                ),
              ),
              //CATEGORIAS
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Selecione as Categorias",
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child:  _buildChips(),
              ),
              //FOTOGRAFIA DE CAPA
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Escolha a Fotografia de Capa",
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Stack(
                              alignment: const Alignment(1.0, -1.21), //posição do icon
                              children: <Widget>[
                                ClipShadow(
                                  clipper: MyClipper(),
                                  boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 0, spreadRadius: 7,
                                      offset: Offset(5.5, 1.0))],
                                  child: Container(
                                    height: 270,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.bookmark_rounded,
                                  ),
                                  iconSize: 70,
                                  color: Theme.of(context).backgroundColor,
                                  onPressed: (){},
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(12,80,12,12),
                              //transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                          bottomRight: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0),
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    height: 30,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                          bottomRight: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0),
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                          bottomRight: Radius.circular(40.0),
                                          bottomLeft: Radius.circular(40.0),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.white.withOpacity(0.95), // background
                                onPrimary: Colors.black, // foreground
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(12),
                              ),
                              onPressed: () { },
                              child: Icon(
                                Icons.photo_camera_rounded,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Câmara",
                                style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[900])),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.white.withOpacity(0.95), // background
                                onPrimary: Colors.black, // foreground
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(12),
                              ),
                              onPressed: () { },
                              child: Icon(
                                Icons.image_rounded,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Galeria",
                                style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[900])),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.white.withOpacity(0.95), // background
                                onPrimary: Colors.black, // foreground
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(12),
                              ),
                              onPressed: () { },
                              child: Icon(
                                Icons.collections_rounded,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Galeria Vagos",
                                style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[900])),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //VISIBILIDADE
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Divider(
                  thickness: 2,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Text("Defina a Visibilidade",
                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Theme.of(context).primaryColor, // background
                            onPrimary: Colors.white, // foreground
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(12),
                          ),
                          onPressed: () { },
                          child: Icon(
                            Icons.person_rounded,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Privado",
                            style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[900])),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.grey[300], // background
                            onPrimary: Colors.black, // foreground
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(12),
                          ),
                          onPressed: () { },
                          child: Icon(
                            Icons.group_rounded,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Seguidores",
                            style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[900])),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.grey[300], // background
                            onPrimary: Colors.black, // foreground
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(12),
                          ),
                          onPressed: () { },
                          child: Icon(
                            Icons.public_rounded,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Público",
                            style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[900])),
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