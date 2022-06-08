import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:vagos_app/model/chips.dart';
import 'package:vagos_app/data/chips.dart';
import 'package:vagos_app/styles/my_icons.dart';
import 'package:vagos_app/tabs/tab_eco_atividades.dart';
import 'package:vagos_app/tabs/tab_eco_percursos.dart';


class Eco extends StatefulWidget {
  const Eco({Key key}) : super(key: key);

  @override
  _EcoState createState() => _EcoState();
}

class _EcoState extends State<Eco> with SingleTickerProviderStateMixin{


  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }



 //para as CATEGORIAS CHIPS
  bool _selected = false;
  bool _selected2 = false;

  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;


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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            //indicatorColor: Colors.white, //preferi deixar a amarelo que vem por default por ser a cor secundária
            tabs: [
              Tab(
                text: 'PERCURSOS',
                icon: CustomIcon('assets/icons/logo_cores_24x24.png'),
              ),
              Tab(
                text: 'ATIVIDADES',
                icon: Icon(Icons.rowing_outlined),
              ),
            ],
          ),
          title: Text('Ecoturismo'),
          actions: <Widget> [
            IconButton(icon: Icon(Icons.search_rounded), onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            })
          ],
        ),

        body: TabBarView(controller: _tabController, children: [
          Center(
            child: Percursos(),
          ),
          Center(
            child: Atividades(),
          ),
        ]),
        floatingActionButton: _bottomButtons(),
      ),
    );
  }
  Widget _bottomButtons() {
    return _tabController.index == 0
        ? FloatingActionButton(
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

                          Padding( //ORÇAMENTO texto
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Distância",
                                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                                  ),
                                  //mostar os valores do slider ao lado do orçamento
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('${_rangeSliderDiscreteValues.start.round()}',
                                        style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                      ),
                                      Text('Km a ',
                                        style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: Colors.grey[500])),
                                      ),
                                      Text('${_rangeSliderDiscreteValues.end.round()}',
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
                          ),
                          Padding( //ORÇAMENTO SLIDER
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: RangeSlider(
                              values: _rangeSliderDiscreteValues,
                              min: 0,
                              max: 100,
                              divisions: 50,
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

                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Categorias",
                              style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 30,
                                      child: Row(
                                        children: [
                                          FilterChip(
                                              selected: _selected,
                                              label: Text('Comunidade'),
                                              labelStyle: TextStyle(color: Colors.white),
                                              backgroundColor: Colors.black54,
                                              selectedColor: Colors.blue,
                                              elevation: 4,
                                              pressElevation: 8,
                                              avatar: Icon(
                                                Icons.person_rounded,
                                                color: Colors.white,
                                              ),
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _selected = !_selected;
                                                });
                                              }
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: FilterChip(
                                                selected: _selected2,
                                                label: Text('Oficial'),
                                                labelStyle: TextStyle(color: Colors.white),
                                                backgroundColor: Colors.black54,
                                                selectedColor: Colors.blue,
                                                elevation: 4,
                                                pressElevation: 8,
                                                avatar: Icon(
                                                  Icons.verified_rounded,
                                                  color: Colors.white,
                                                ),
                                                onSelected: (bool selected) {
                                                  setState(() {
                                                    _selected2 = !_selected2;
                                                  });
                                                }
                                            ),
                                          ),
                                        ],
                                      )
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
        ))
        : FloatingActionButton(
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

                        Padding( //ORÇAMENTO texto
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: ListTile(
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
                        ),
                        Padding( //ORÇAMENTO SLIDER
                          padding: const EdgeInsets.only(bottom: 16.0),
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

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Categorias",
                            style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        FilterChip(
                                            selected: _selected3,
                                            label: Text('Campismo'),
                                            labelStyle: TextStyle(color: Colors.white),
                                            backgroundColor: Colors.black54,
                                            selectedColor: Colors.blue,
                                            elevation: 4,
                                            pressElevation: 8,
                                            avatar: Icon(
                                              FontAwesomeIcons.campground,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                            onSelected: (bool selected) {
                                              setState(() {
                                                _selected3 = !_selected3;
                                              });
                                            }
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: FilterChip(
                                              selected: _selected4,
                                              label: Text('Surf'),
                                              labelStyle: TextStyle(color: Colors.white),
                                              backgroundColor: Colors.black54,
                                              selectedColor: Colors.blue,
                                              elevation: 4,
                                              pressElevation: 8,
                                              avatar: Icon(
                                                Icons.surfing_rounded,
                                                color: Colors.white,
                                              ),
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _selected4 = !_selected4;
                                                });
                                              }
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: FilterChip(
                                              selected: _selected5,
                                              label: Text('Hipismo'),
                                              labelStyle: TextStyle(color: Colors.white),
                                              backgroundColor: Colors.black54,
                                              selectedColor: Colors.blue,
                                              elevation: 4,
                                              pressElevation: 8,
                                              avatar: Icon(
                                                FontAwesomeIcons.horse,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _selected5 = !_selected5;
                                                });
                                              }
                                          ),
                                        ),

                                      ],
                                    )
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




//para fazer o icon logo mudar de cor --- foi necessário ser png por causa do CustomIcon
class CustomIcon extends StatelessWidget{
  const CustomIcon(this.name, { Key key, this.size, this.color, }) : super(key: key);

  final String name;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {

    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconOpacity = iconTheme.opacity;
    Color iconColor = color ?? iconTheme.color;

    if (iconOpacity != 1.0) iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
    return Image.asset(name, color: iconColor, height: size,);
  }
}



//PROCURAR
class DataSearch extends SearchDelegate<String> {

  String get searchFieldLabel => "Procurar";

  final interesses = [
    "Trilho da Lontra",
    "Biblioteca",
    "Praia da Vagueira",
    "Praia do Areão",
    "Vagos Metal Fest",
    "Campismo"
  ];

  final recentInteresses = [
    "Praia da Vagueira",
    "Vagos Metal Fest",
    "Campismo"
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
    final suggestionList = query.isEmpty?recentInteresses:interesses.where((p)=>p.startsWith(query)).toList();

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
