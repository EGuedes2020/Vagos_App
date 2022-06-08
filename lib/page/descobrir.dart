import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vagos_app/data/chips.dart';
import 'package:vagos_app/model/chips.dart';
import 'package:vagos_app/page/descobrir/alojamento.dart';
import 'package:vagos_app/page/descobrir/cultura.dart';
import 'package:vagos_app/page/descobrir/diversao.dart';
import 'package:vagos_app/page/descobrir/praias.dart';
import 'package:vagos_app/page/descobrir/religiao.dart';

import 'carta.dart';

import 'descobrir/ecoturismo.dart';
import 'descobrir/lazer.dart';

class Descobrir extends StatefulWidget {
  const Descobrir({Key key}) : super(key: key);

  @override
  _DescobrirState createState() => _DescobrirState();
}


//PRINCIPAL
class _DescobrirState extends State<Descobrir> {


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
    return Scaffold(
      appBar: AppBar(
        title: Text('Descobrir'),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.search_rounded), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Eco(),  //MUDAR  pq é só para testar o on press da imagem
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Stack(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.26),
                            blurRadius: 6.0,
                            spreadRadius: 4.0,
                            offset: Offset(0.0, 4.0), // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.transparent,
                        image: DecorationImage(
                          alignment: const Alignment(0.0, 0.8),
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/imagens/eco_ctg.jpg',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.leaf, color: Colors.white, size: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text('Ecoturismo', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                            ),
                          ],
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Theme.of(context).primaryColor,
                          gradient: LinearGradient(
                              begin: FractionalOffset.bottomCenter,
                              end: FractionalOffset.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.0),
                                Colors.black.withOpacity(0.5),
                              ],
                              stops: [
                                0.62,
                                1.0,
                              ])),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Cultura(),  //MUDAR  pq é só para testar o on press da imagem
                        ));
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.transparent,
                            image: DecorationImage(
                              alignment: const Alignment(-1.0, 0.0),
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/imagens/cultura_ctg.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.museum_rounded, color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('Cultura', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.55),
                                  ],
                                  stops: [
                                    0.5,
                                    1.0,
                                  ])),
                        )
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Praias(),  //MUDAR  pq é só para testar o on press da imagem
                        ));
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0), 
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.transparent,
                            image: DecorationImage(
                              alignment: const Alignment(1.0, 0.0),
                              scale: 4,
                              fit: BoxFit.none,
                              image: AssetImage(
                                'assets/imagens/praia_da_vagueira_barco.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.beach_access_rounded, color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('Praias', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Theme.of(context).primaryColor,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.55),
                                  ],
                                  stops: [
                                    0.65,
                                    0.83,
                                  ])),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Religiao(),  //MUDAR  pq é só para testar o on press da imagem
                        ));
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.transparent,
                            image: DecorationImage(
                              alignment: const Alignment(1.0, -1.0),
                              scale: 3,
                              fit: BoxFit.none,
                              image: AssetImage(
                                'assets/imagens/religião_ctg.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: Icon(FontAwesomeIcons.cross, color: Colors.white, size: 20,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text('Religião', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Theme.of(context).primaryColor,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.70),
                                  ],
                                  stops: [
                                    0.65,
                                    1.0,
                                  ])),
                        )
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Diversao(),  //MUDAR  pq é só para testar o on press da imagem
                        ));
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/imagens/diversão_ctg.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.attractions, color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('Diversão', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Theme.of(context).primaryColor,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.5),
                                  ],
                                  stops: [
                                    0.75,
                                    1.0,
                                  ])),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 100, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Lazer(),  //MUDAR  pq é só para testar o on press da imagem
                        ));
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/imagens/lazer_ctg.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.nature_people_rounded, color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('Lazer', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Theme.of(context).primaryColor,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.55),
                                  ],
                                  stops: [
                                    0.63,
                                    0.83,
                                  ])),
                        )
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Alojamento(),  //MUDAR  pq é só para testar o on press da imagem
                        ));
                      },
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.26),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.transparent,
                            image: DecorationImage(
                              alignment: const Alignment(-0.8, 0.0),
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/imagens/estadia_ctg.jpg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.hotel_rounded, color: Colors.white,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text('Estadia', style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.435,
                          height: 150.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Theme.of(context).primaryColor,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.0),
                                    Colors.black.withOpacity(0.55),
                                  ],
                                  stops: [
                                    0.5,
                                    0.95,
                                  ])),
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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
