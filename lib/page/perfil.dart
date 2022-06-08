import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:clip_shadow/clip_shadow.dart';
import 'package:page_transition/page_transition.dart';

import 'package:vagos_app/styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sticky_headers/sticky_headers.dart';

import '../entrar.dart';


var scaffoldKey = GlobalKey<ScaffoldState>(); //para mudar o icon do drawer

class Perfil extends StatefulWidget {
  const Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {


  //ICON GUARDAR
  Color _saveColor = Color(0xfffafafa);
  Color _saveColor2 = Color(0xfffafafa);


  //RADIO
  int selectedRadio;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey, //para mudar o icon do drawer
        appBar: AppBar(
          title: Text('Perfil'),
          actions: [
            IconButton(
                icon: Icon(Icons.settings_rounded),
                onPressed: (){
                  scaffoldKey.currentState.openEndDrawer();
                }),
          ],
        ),
        endDrawer: ClipPath(
          //clipper: _DrawerClipper(), //comentar isto e a cena de baixo se quiser a direito
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 40.0,horizontal: 0.0),
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: ListTile(
                    title: Text("Configurações da Aplicação",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                    ),
                    onTap: (){
                      //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_rounded, color: Theme.of(context).primaryColor.withOpacity(0.9),),  //Colors.grey[700]
                  title: Text("Configurações do Perfil",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                  ),
                  onTap: (){
                    //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications_rounded, color: Theme.of(context).primaryColor.withOpacity(0.9)),
                  title: Text("Notificações",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                  ),
                  onTap: (){
                    //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                  },
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Icon(FontAwesomeIcons.solidMoon, size: 20.0,color: Theme.of(context).primaryColor.withOpacity(0.9)),
                  ),
                  title: Text("Modo Noturno",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                  ),
                  onTap: (){
                    //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: ListTile(
                    title: Text("Idioma",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                    ),
                    onTap: (){
                      //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.language_rounded, color: Theme.of(context).primaryColor.withOpacity(0.9)),
                  title: Text("Português",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                  ),
                  onTap: (){
                    //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: ListTile(
                    title: Text("Ajuda e Suporte",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                    ),
                    onTap: (){
                      //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone_rounded, color: Theme.of(context).primaryColor.withOpacity(0.9)),
                  title: Text("Contacte-nos",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                  ),
                  onTap: (){
                    //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help_rounded, color: Theme.of(context).primaryColor.withOpacity(0.9)),
                  title: Text("FAQ",
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                  ),
                  onTap: (){
                    //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: ListTile(
                    title: Text("Conta",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.grey[900])),
                    ),
                    onTap: (){
                      //Navigator.of(context).pop();  //não vai fazer nada porque não vou criar essas páginas
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70.0), //tive de meter, porque a barra de navegação estava a tapar o conteúdo
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Theme.of(context).primaryColor.withOpacity(0.9)),
                    title: Text("Terminar Sessão",
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.grey[700])),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Entrar()));

                    },
                  ),
                ),
              ],
            ),
          ),
        ),




        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipShadow(
                      clipper: MyClipper(),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 30, spreadRadius: 10,
                          offset: Offset(0.0, 1.0))],
                      child: Container(
                        height: 380,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ClipShadow(
                      clipper: MyClipper(),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 30, spreadRadius: 10,
                          offset: Offset(0.0, 1.0))],
                      child: Container(
                        height: 290,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              child: ClipOval(
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                      'assets/imagens/perfil_rodrigo_campos.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              radius: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Rodrigo Campos', style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Colors.white)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('@rodrigocampos', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white.withOpacity(0.76))),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text('24', style: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),),
                                      ),
                                      Text('Seguidores', style: Theme.of(context).textTheme.subtitle1,),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text('2', style: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor)),),
                                      ),
                                      Text('Roteiros', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Theme.of(context).primaryColor)),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text('16', style: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),),
                                      ),
                                      Text('A Seguir', style: Theme.of(context).textTheme.subtitle1,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //TABS NO BODY
              Container(
                transform: Matrix4.translationValues(0.0, -45.0, 0.0),
                height: 644,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  DefaultTabController(
                      length: 3, // length of tabs
                      initialIndex: 0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.grey[500],
                            indicatorColor: Theme.of(context).primaryColor,
                            indicatorWeight: 2.0,
                            tabs: [
                              Tab(text: 'ROTEIROS', icon: Icon(Icons.tour_rounded),),
                              Tab(text: 'GUARDADOS', icon: Icon(Icons.bookmark_rounded),),
                              Tab(text: 'PERCURSOS', icon: CustomIcon('assets/icons/logo_cores_24x24.png'),),
                            ],
                          ),
                        ),

                        //CONTEUDO DAS TABS
                        Container(
                            height: 570, //height of TabBarView
                            child: TabBarView(children: <Widget>[
                              
                              //Roteiros
                              ListView(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 559,
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight, //posição do icon
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                    decoration: new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                      child: IconButton(
                                                        onPressed: () {},
                                                         icon: const Icon(
                                                          Icons.public_rounded,
                                                        ),
                                                        color: Theme.of(context).primaryColor,
                                                        iconSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                padding: EdgeInsets.only(top: 5),
                                                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 559,
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight, //posição do icon
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: IconButton(
                                                          icon: const Icon(
                                                            Icons.person_rounded,
                                                          ),
                                                          color: Theme.of(context).accentColor,
                                                          iconSize: 30,
                                                          onPressed: (){
                                                            //meter aqui um alert com a cena para mudar avisibilidade
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                padding: EdgeInsets.only(top: 5),
                                                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 559,
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight, //posição do icon
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: IconButton(
                                                          icon: const Icon(
                                                            Icons.people_rounded,
                                                          ),
                                                          color: Theme.of(context).primaryColor,
                                                          iconSize: 30,
                                                          onPressed: (){
                                                            //meter aqui um alert com a cena para mudar avisibilidade
                                                          }),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                padding: EdgeInsets.only(top: 5),
                                                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                ],
                              ),
                              


                              //GUARDADOS
                              ListView(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 559,
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
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                padding: EdgeInsets.only(top: 5),
                                                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 559,
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
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                padding: EdgeInsets.only(top: 5),
                                                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          height: 559,
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
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                padding: EdgeInsets.only(top: 5),
                                                //transform: Matrix4.translationValues(0.0, -10.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                ],
                              ),




                              //PERCURSOS
                              ListView(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight, //posição do icon
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.public_rounded,
                                                        ),
                                                        color: Theme.of(context).primaryColor,
                                                        iconSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                      padding: EdgeInsets.only(top: 35, right: 60, left: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Icon(FontAwesomeIcons.route, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 12),
                                                                child: Row(
                                                                  children: [
                                                                    Text('8.3', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 4),
                                                                      child: Text('Km', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Icon(Icons.schedule_rounded, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 12),
                                                                child: Row(
                                                                  children: [
                                                                    Text('1:34', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 4),
                                                                      child: Text('h', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration: new BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  image: new DecorationImage(
                                                                      fit: BoxFit.fill,
                                                                      image: new AssetImage(
                                                                          'assets/imagens/mapa_circulo.png')
                                                                  )
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25,bottom: 6),
                                                child: Row(
                                                  children: [
                                                    ElevatedButton.icon(
                                                        onPressed: () {
                                                          // METER A MUDAR DE COR FUTURAMENTE
                                                        },
                                                        icon: Icon(Icons.favorite_rounded, size: 18),
                                                        label: Text("24"),
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: OutlinedButton.icon(
                                                          onPressed: () {
                                                            // METER A MUDAR DE COR FUTURAMENTE
                                                          },
                                                          icon: Icon(Icons.share_rounded, size: 18),
                                                          label: Text("4"),
                                                          style: ButtonStyle(
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                  )
                                                              )
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
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight, //posição do icon
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.person_rounded,
                                                        ),
                                                        color: Theme.of(context).accentColor,
                                                        iconSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                      padding: EdgeInsets.only(top: 35, right: 60, left: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Icon(FontAwesomeIcons.route, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 12),
                                                                child: Row(
                                                                  children: [
                                                                    Text('8.3', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 4),
                                                                      child: Text('Km', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Icon(Icons.schedule_rounded, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 12),
                                                                child: Row(
                                                                  children: [
                                                                    Text('1:34', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 4),
                                                                      child: Text('h', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration: new BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  image: new DecorationImage(
                                                                      fit: BoxFit.fill,
                                                                      image: new AssetImage(
                                                                          'assets/imagens/mapa_circulo.png')
                                                                  )
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25,bottom: 6),
                                                child: Row(
                                                  children: [
                                                    ElevatedButton.icon(
                                                        onPressed: () {
                                                          // METER A MUDAR DE COR FUTURAMENTE
                                                        },
                                                        icon: Icon(Icons.favorite_rounded, size: 18),
                                                        label: Text("24"),
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: OutlinedButton.icon(
                                                          onPressed: () {
                                                            // METER A MUDAR DE COR FUTURAMENTE
                                                          },
                                                          icon: Icon(Icons.share_rounded, size: 18),
                                                          label: Text("4"),
                                                          style: ButtonStyle(
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                  )
                                                              )
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
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight, //posição do icon
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
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                          Icons.people_rounded,
                                                        ),
                                                        color: Theme.of(context).primaryColor,
                                                        iconSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                transform: Matrix4.translationValues(25.0, -15.0, 0.0),  //meter valores negativos na posição porque na margem, no padding e positioned não funciona
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
                                                      padding: EdgeInsets.only(top: 35, right: 60, left: 10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Icon(FontAwesomeIcons.route, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 12),
                                                                child: Row(
                                                                  children: [
                                                                    Text('8.3', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 4),
                                                                      child: Text('Km', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Icon(Icons.schedule_rounded, size: 30,),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 12),
                                                                child: Row(
                                                                  children: [
                                                                    Text('1:34', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w600, )),),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 4),
                                                                      child: Text('h', style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w200, color: Colors.grey[500])),),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              decoration: new BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  image: new DecorationImage(
                                                                      fit: BoxFit.fill,
                                                                      image: new AssetImage(
                                                                          'assets/imagens/mapa_circulo.png')
                                                                  )
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 25,bottom: 6),
                                                child: Row(
                                                  children: [
                                                    ElevatedButton.icon(
                                                        onPressed: () {
                                                          // METER A MUDAR DE COR FUTURAMENTE
                                                        },
                                                        icon: Icon(Icons.favorite_rounded, size: 18),
                                                        label: Text("24"),
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: OutlinedButton.icon(
                                                          onPressed: () {
                                                            // METER A MUDAR DE COR FUTURAMENTE
                                                          },
                                                          icon: Icon(Icons.share_rounded, size: 18),
                                                          label: Text("4"),
                                                          style: ButtonStyle(
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(18.0),
                                                                  )
                                                              )
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
                                  ),
                                ],
                              ),
                            ])
                        )
                      ])
                  ),
                ]),
              ),





            ],
          ),
        ),
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
