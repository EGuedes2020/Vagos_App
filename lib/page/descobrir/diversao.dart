import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vagos_app/styles/my_icons.dart';

import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;


class Diversao extends StatefulWidget {
  const Diversao({Key key}) : super(key: key);

  @override
  _DiversaoState createState() => _DiversaoState();
}

class _DiversaoState extends State<Diversao> {
  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);


  //para as CATEGORIAS CHIPS
  bool _selected = false;
  bool _selected2 = false;

  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;
  bool _selected6 = false;
  bool _selected7 = false;


  //para o ORDENAR por
  String valueChoose;
  List listItem = [
    "Recomendado", "Popular", "Classificação"
  ];



  //PARA O SLIDE
  RangeValues _rangeSliderDiscreteValues = const RangeValues(5, 10);
  RangeValues _rangeSliderDiscreteValues2 = const RangeValues(20, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diversão'),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
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
                        padding: EdgeInsets.only(right: 50),
                        transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vagos Metal Fest',
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
                              padding: const EdgeInsets.only(top: 25,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.event_rounded),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('28 de Julho, 2021', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.euro_rounded),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text('desde 42,95', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0, left: 4.5),
                              child:Row(
                                //crossAxisAlignment: CrossAxisAlignment.end, //prefiro centrado no meio
                                children: [
                                  SvgPicture.asset(logo, height: 24.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text('Quinta do Ega', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, bottom: 6),
                        child: ActionChip(
                          avatar: Icon(FontAwesomeIcons.guitar, size: 20,),
                          label: Text(
                            'Festival',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          onPressed: () {}, //encontrar os roteiros dessa categoria
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
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
                          padding: EdgeInsets.only(right: 50),
                          transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vagos Metal Fest',
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
                                padding: const EdgeInsets.only(top: 25,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.event_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('28 de Julho, 2021', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.euro_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('desde 42,95', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, left: 4.5),
                                child:Row(
                                  //crossAxisAlignment: CrossAxisAlignment.end, //prefiro centrado no meio
                                  children: [
                                    SvgPicture.asset(logo, height: 24.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text('Quinta do Ega', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, bottom: 6),
                          child: ActionChip(
                            avatar: Icon(FontAwesomeIcons.guitar, size: 20,),
                            label: Text(
                              'Festival',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            onPressed: () {}, //encontrar os roteiros dessa categoria
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 70),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
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
                          padding: EdgeInsets.only(right: 50),
                          transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vagos Metal Fest',
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
                                padding: const EdgeInsets.only(top: 25,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.event_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('28 de Julho, 2021', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.euro_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Text('desde 42,95', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, left: 4.5),
                                child:Row(
                                  //crossAxisAlignment: CrossAxisAlignment.end, //prefiro centrado no meio
                                  children: [
                                    SvgPicture.asset(logo, height: 24.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text('Quinta do Ega', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, bottom: 6),
                          child: ActionChip(
                            avatar: Icon(FontAwesomeIcons.guitar, size: 20,),
                            label: Text(
                              'Festival',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            onPressed: () {}, //encontrar os roteiros dessa categoria
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(    //sem isto, as cenas não atualizam pq o bottomSheet n é stateful
                    builder: (context, setState){
                      return Wrap(
                        children: [
                          ListTile(
                            title: Text(
                              'Filtro',
                              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontSize: 18))
                                  .copyWith(color: Colors.white),
                            ),
                            tileColor: Theme.of(context).primaryColor,
                          ),

                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Ao teu Redor",
                                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                                ),
                                //mostar os valores do slider ao lado do orçamento
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('${_rangeSliderDiscreteValues2.start.round()}',
                                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    ),
                                    Text('Km a ',
                                      style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[500])),
                                    ),
                                    Text('${_rangeSliderDiscreteValues2.end.round()}',
                                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    ),
                                    Text('Km',
                                      style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[500])),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding( //ORÇAMENTO SLIDER
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: RangeSlider(
                              values: _rangeSliderDiscreteValues2,
                              min: 0,
                              max: 500,
                              divisions: 50,
                              activeColor: Color(0xff1A9DD9),
                              inactiveColor: Colors.grey[300],
                              labels: RangeLabels(
                                _rangeSliderDiscreteValues2.start.round().toString(),
                                _rangeSliderDiscreteValues2.end.round().toString(),
                              ),
                              onChanged: (values) {
                                setState(() {
                                  _rangeSliderDiscreteValues2 = values;
                                });
                              },
                            ),
                          ),

                          Center(
                              child: new MaterialButton(
                                  color: Theme.of(context).accentColor,
                                  onPressed: () async {
                                    final List<DateTime> picked = await DateRangePicker.showDatePicker(
                                        context: context,
                                        locale : const Locale("pt"),
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                                        firstDate: new DateTime(2020),
                                        lastDate: new DateTime(DateTime.now().year + 2)
                                    );
                                    if (picked != null && picked.length == 2) {
                                      print(picked);
                                    }
                                  },
                                  child: new Text("SELECIONE UMA DATA")
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text("Categorias",
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(16,8,16,0),
                              child: Column(
                                children: <Widget>[
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 0,
                                    children: [
                                      FilterChip(
                                          selected: _selected3,
                                          label: Text('Festival'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            FontAwesomeIcons.guitar,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected3 = !_selected3;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected7,
                                          label: Text('Cinema'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.theaters_rounded,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected7 = !_selected7;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected5,
                                          label: Text('Piscinas'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.pool_rounded,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected5 = !_selected5;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected4,
                                          label: Text('Golfe'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.golf_course_rounded,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected4 = !_selected4;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected6,
                                          label: Text('Teatro'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.theater_comedy,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected6 = !_selected6;
                                            });
                                          }
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(16,16,16,40),
                            child: Container(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton(
                                hint: Text('Ordenar por'),
                                //dropdownColor: Theme.of(context).primaryColor,
                                //icon: Icon(Icons.arrow_drop_down_rounded),
                                isExpanded: true,
                                underline: SizedBox(),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                  });
                                },
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                );
              });
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.filter_list_rounded,
        ),
      )
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

