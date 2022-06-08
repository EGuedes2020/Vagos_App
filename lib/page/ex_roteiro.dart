import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/data/menu_items.dart';
import 'package:vagos_app/model/menu_item.dart';
import 'package:vagos_app/page/classificar_roteiro.dart';
import 'package:vagos_app/page/perfil_outro.dart';
import 'package:vagos_app/styles/my_icons.dart';
import 'package:vagos_app/tabs/ex_roteiro_principal.dart';
import 'package:vagos_app/tabs/ex_roteiro_reviews.dart';
import 'carta.dart';

import 'descobrir/ecoturismo.dart';


class ExRoteiro extends StatefulWidget {
  const ExRoteiro({Key key}) : super(key: key);

  @override
  _ExRoteiroState createState() => _ExRoteiroState();
}

class _ExRoteiroState extends State<ExRoteiro> with SingleTickerProviderStateMixin{


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
                text: 'ROTEIRO',
                icon: Icon(Icons.tour_rounded),
              ),
              Tab(
                text: 'REVIEWS',
                icon: Icon(Icons.reviews_rounded),
              ),
            ],
          ),
          title: Text('Melhor de Vagos'),
          actions: <Widget> [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  ...MenuItems.itemsFirst.map(buildItem).toList(),
                ],
            ),
          ],
        ),
        body: TabBarView(controller: _tabController, children: [
          Center(
            child: ExRoteiroPrincipal(),
          ),
          Center(
            child: ExRoteiroReviews(),
          ),
        ]),
        floatingActionButton: _bottomButtons(),
      ),
    );
  }


  //MUNU ITEM
  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value: item,
    child: Row(
        children: [
          Icon(item.icon, color: Theme.of(context).primaryColor.withOpacity(0.8), size: 24,),
          const SizedBox(width: 12,),
          Text(item.text),
        ],
      ),
  );


  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemGuardar:
        //meter futuramente o icon a preencher
        break;
      case MenuItems.itemPartilhar:
        //meter a partilhar
        break;
      case MenuItems.itemReportar:
        //meter a reportar
        break;
      case MenuItems.itemAutor:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PerfilOutro())
        );
        break;
    }
  }
  


  //MUDAR O FAB ENTRE AS TABS
  Widget _bottomButtons() {
    return _tabController.index == 0
        ? FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: (){
        ////
      },
      backgroundColor: Colors.white,
      child: SvgPicture.asset(logo_cores, height: 35.0),)
        : FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: (){
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: ClassificarRoteiro(),
          ),
        );
      },
      backgroundColor: Theme.of(context).accentColor,
      child: Icon(
        Icons.star_rate_rounded,
        //size: 30.0,
        color: Colors.grey[900],
      ),
    );
  }
}

