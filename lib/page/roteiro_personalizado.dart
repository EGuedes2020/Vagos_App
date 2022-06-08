import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/home.dart';

import 'package:vagos_app/model/chips.dart';
import 'package:vagos_app/data/chips.dart';
import 'package:vagos_app/page/inicio.dart';

import 'package:clip_shadow/clip_shadow.dart';
import 'package:vagos_app/page/roteiro_personalizado_resultado.dart';
import 'package:vagos_app/styles/my_icons.dart';

import '../main.dart';

class RoteiroPersonalizado extends StatefulWidget {
  const RoteiroPersonalizado({Key key}) : super(key: key);

  @override
  _RoteiroPersonalizadoState createState() => _RoteiroPersonalizadoState();
}

class _RoteiroPersonalizadoState extends State<RoteiroPersonalizado> {

  //para os SLIDERS
  double _sliderDiscreteValue = 20;  //para o primeiro slide
  RangeValues _rangeSliderDiscreteValues = const RangeValues(20, 100); //para o segundo slide

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
        title: Text('Roteiro Personalizado'),
        actions: [
          IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja sair?'),
                  content: const Text('Se sair agora, perderá tudo o que fez!'),
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
            ListTile(
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
            Padding( //DIAS SLIDER
              padding: const EdgeInsets.only(bottom: 6.0),
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
            ListTile(
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
            Padding( //ORÇAMENTO SLIDER
              padding: const EdgeInsets.only(bottom: 6.0),
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
            ListTile(
              title: Text("Categorias",
                style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
              ),
            ),

            //CATEGORIAS CHIPS
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(16, 4, 16, 0),
                child: _buildChips()),

            //DIVIDER
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Divider(
                thickness: 1.5,
                //podia tirar aquele espaço sem nada embaixo do risco, mas ficou visualmente menos apelativo
              ),
            ),

            //CARTAS
            Container(
              height: 500,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
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
                      color: Theme.of(context).selectedRowColor,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
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
                            icon: Icon(Icons.add_circle_rounded),
                            color: Colors.white,
                            onPressed: (){
                              //meter a selecionar e a remover
                            },
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
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
                            icon: Icon(Icons.add_circle_rounded),
                            color: Colors.white,
                            onPressed: (){
                              //meter a selecionar e a remover
                            },
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
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
                            icon: Icon(Icons.add_circle_rounded),
                            color: Colors.white,
                            onPressed: (){
                              //meter a selecionar e a remover
                            },
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                            icon: Icon(Icons.add_circle_rounded),
                            color: Colors.white,
                            onPressed: (){
                              //meter a selecionar e a remover
                            },
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.bottomRight, child: RoteiroPersonalizadoResultado()));

        },
        child: Icon(
          Icons.arrow_forward_rounded,
        ),
      ),
    );
  }
}
