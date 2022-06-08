import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vagos_app/styles/my_icons.dart';

import '../../entrar.dart';
import '../descobrir.dart';

import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class Cultura extends StatefulWidget {
  const Cultura({Key key}) : super(key: key);

  @override
  _CulturaState createState() => _CulturaState();
}

class _CulturaState extends State<Cultura> {

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
        title: Text('Cultura'),
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
                        transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Festa da Pinha',
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
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.event_rounded),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Text('8 de Setembro, 2021', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16, top: 12, left: 4.5,),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(logo, height: 24.0),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.7,
                                              child: Text('Ponte de Vagos', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),)),
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
                        margin: EdgeInsets.only(left: 30),
                        transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                        child: ActionChip(
                          avatar: Icon(Icons.celebration_rounded, ),
                          label: Text(
                            'Festa Tradicional',
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
                          transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Festa da Pinha',
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
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.event_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: Text('8 de Setembro, 2021', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16, top: 12, left: 4.5,),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(logo, height: 24.0),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.7,
                                                child: Text('Ponte de Vagos', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),)),
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
                          margin: EdgeInsets.only(left: 30),
                          transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                          child: ActionChip(
                            avatar: Icon(Icons.celebration_rounded, ),
                            label: Text(
                              'Festa Tradicional',
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
                padding: const EdgeInsets.only(top: 8.0, bottom: 85),
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
                          transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Festa da Pinha',
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
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.event_rounded),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: Text('8 de Setembro, 2021', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16, top: 12, left: 4.5,),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(logo, height: 24.0),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.7,
                                                child: Text('Ponte de Vagos', style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),)),
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
                          margin: EdgeInsets.only(left: 30),
                          transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
                          child: ActionChip(
                            avatar: Icon(Icons.celebration_rounded, ),
                            label: Text(
                              'Festa Tradicional',
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
                                Text("Orçamento Mínimo",
                                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                                ),
                                //mostar os valores do slider ao lado do orçamento
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('${_rangeSliderDiscreteValues2.start.round()}',
                                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    ),
                                    Text('€ a ',
                                      style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[500])),
                                    ),
                                    Text('${_rangeSliderDiscreteValues2.end.round()}',
                                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    ),
                                    Text('€',
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
                                          label: Text('Festa Tradicional'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.celebration_rounded,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected3 = !_selected3;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected4,
                                          label: Text('Museu'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.museum_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected4 = !_selected4;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected5,
                                          label: Text('Feira'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            Icons.storefront_rounded,
                                            color: Colors.white,
                                          ),
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _selected5 = !_selected5;
                                            });
                                          }
                                      ),

                                      FilterChip(
                                          selected: _selected6,
                                          label: Text('Biblioteca'),
                                          labelStyle: TextStyle(color: Colors.white),
                                          backgroundColor: Colors.black54,
                                          selectedColor: Colors.blue,
                                          elevation: 4,
                                          pressElevation: 8,
                                          avatar: Icon(
                                            FontAwesomeIcons.book,
                                            size: 18,
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
      ),
    );
  }
}


