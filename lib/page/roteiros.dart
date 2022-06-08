import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'package:vagos_app/model/chips.dart';
import 'package:vagos_app/data/chips.dart';
import 'package:vagos_app/page/criar_roteiro.dart';
import 'package:vagos_app/page/ex_roteiro.dart';
import 'package:vagos_app/page/inicio.dart';

import 'package:clip_shadow/clip_shadow.dart';

var scaffoldKey = GlobalKey<ScaffoldState>(); //para mudar o icon do drawer

class Roteiros extends StatefulWidget {
  const Roteiros({Key key}) : super(key: key);

  @override
  _RoteirosState createState() => _RoteirosState();
}

class _RoteirosState extends State<Roteiros> {

  //para os SLIDERS
  double _sliderDiscreteValue = 20;  //para o primeiro slide
  RangeValues _rangeSliderDiscreteValues = const RangeValues(20, 100); //para o segundo slide

  //para o ORDENAR por
  String valueChoose;
  List listItem = [
    "Recomendado", "Popular", "Classificação"
  ];


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


  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);


  @override
  Widget build(BuildContext context) {

    //PRINCIPAL
    return Scaffold(
      key: scaffoldKey, //para mudar o icon do drawer
      appBar: AppBar(
        title: Text('Roteiros'),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          }),
          IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.topRight, child: CriarRoteiro()));

          }),
          IconButton(icon: Icon(Icons.filter_list_rounded), onPressed: () {
            scaffoldKey.currentState.openEndDrawer();
          }),
        ],
      ),





      endDrawer: Drawer( //endDrawer com FILTRO
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 40.0,horizontal: 0.0),
          children: [
            Padding( //DIAS texto
              padding: const EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dias",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${_sliderDiscreteValue.round()}',
                          style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Padding( //DIAS SLIDER
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Slider(
              value: _sliderDiscreteValue,
              min: 0,
              max: 100,
              divisions: 100,
              activeColor: Color(0xff1A9DD9),
              inactiveColor: Colors.grey[300],
              label: _sliderDiscreteValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderDiscreteValue = value;
                });
              },
            ),
          ),
            Padding( //ORÇAMENTO texto
              padding: const EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Orçamento",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                    ),
                    //mostar os valores do slider ao lado do orçamento
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${_rangeSliderDiscreteValues.start.round()}',
                          style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                        ),
                        Text('€ a ',
                          style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[500])),
                        ),
                        Text('${_rangeSliderDiscreteValues.end.round()}',
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
            ),
            Padding( //ORÇAMENTO SLIDER
              padding: const EdgeInsets.only(bottom: 24.0),
              child: RangeSlider(
                values: _rangeSliderDiscreteValues,
                min: 0,
                max: 800,
                divisions: 40,
                activeColor: Color(0xff1A9DD9),
                inactiveColor: Colors.grey[300],
                labels: RangeLabels(
                  _rangeSliderDiscreteValues.start.round().toString(),
                  _rangeSliderDiscreteValues.end.round().toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    _rangeSliderDiscreteValues = values;
                  });
                },
              ),
            ),
            Padding( //CATEGORIAS texto
              padding: const EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                title: Text("Categorias",
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                ),
              ),
            ),

            //CATEGORIAS CHIPS
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0, left: 16.0),
              child:  _buildChips(),
              ),

            //ORDENAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
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
        ),
      ),






      body: SingleChildScrollView(
        child: Column(
          children: [
            //CARTAS
            InkWell(
              onTap: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.bottomCenter, child: ExRoteiro()));

              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                          transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
            Padding(
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
                        transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 95),
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
                        transform: Matrix4.translationValues(25.0, -31.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
          ],
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



//para a PESQUISA
class DataSearch extends SearchDelegate<String> {

  String get searchFieldLabel => "Procurar roteiros";

  final roteiros = [
    "Melhor de Vagos",
    "Praias de Vagos",
    "Cultura de Vagos",
    "Espaços Religiosos",
    //"Vagos Metal Fest",
    //"@antoniovieira"
  ];

  final recentRoteiros = [
    "Melhor de Vagos",
    "Praias de Vagos",
    "Cultura de Vagos",
    //"@antoniovieira"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";  //mete a barra de procura sem texto
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
    return Container(  //carta teste com o NAViGATOR
      height: 200.0,
      width: 200.0,
      child: Card(
        color: Colors.blue,
        child: Center(
          child: Text(query), //vai dar o resultado da procura
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentRoteiros:roteiros.where((p)=>p.startsWith(query)).toList();

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


  //para as CHIPS
  Widget buildChips() => Chip(
    labelPadding: EdgeInsets.all(4),
    avatar: CircleAvatar(
      child: Icon(Icons.add_circle_outline),
      backgroundColor: Colors.white.withOpacity(0.8),
    ),
    label: Text('Chippppp'),
    labelStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    backgroundColor: Colors.red,
  );


}


//FORMA ONDA PRINCIPAL DA APP



