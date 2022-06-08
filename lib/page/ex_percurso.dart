import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/data/menu_items.dart';
import 'package:vagos_app/model/menu_item.dart';
import 'package:vagos_app/page/classificar_percurso.dart';
import 'package:vagos_app/page/mapa.dart';
import 'package:vagos_app/page/perfil_outro.dart';
import 'package:vagos_app/styles/my_icons.dart';
import 'package:vagos_app/tabs/ex_percurso_principal.dart';
import 'package:vagos_app/tabs/ex_percurso_reviews.dart';




class ExPercurso extends StatefulWidget {
  const ExPercurso({Key key}) : super(key: key);

  @override
  _ExPercursoState createState() => _ExPercursoState();
}

class _ExPercursoState extends State<ExPercurso> with SingleTickerProviderStateMixin{


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
                text: 'PERCURSO',
                icon: CustomIcon('assets/icons/logo_cores_24x24.png'),
              ),
              Tab(
                text: 'REVIEWS',
                icon: Icon(Icons.reviews_rounded),
              ),
            ],
          ),
          title: Text('Pontos Religiosos de Vagos'),
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
            child: ExPercursoPrincipal(),
          ),
          Center(
            child: ExPercursoReviews(),
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




  Widget _bottomButtons() {
    return _tabController.index == 0
        ? FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: (){
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: MapScreen(),
            ),
          );
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
            child: ClassificarPercurso(),
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