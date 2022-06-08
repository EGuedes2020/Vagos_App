import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vagos_app/page/inicio.dart';
import 'package:vagos_app/page/mapa.dart';
import 'package:vagos_app/page/roteiros.dart';
import 'package:vagos_app/page/perfil.dart';
import 'package:vagos_app/page/descobrir.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:vagos_app/styles/my_icons.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentTab = 0;
  final List<Widget> screens = [
    Inicio(),
    Roteiros(),
    Perfil(),
    Descobrir(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Inicio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        width: 58,
        height: 58,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(logo_cores, height: 35.0),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MapScreen(),
              ));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff1A9DD9),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      minWidth: 40.0,
                      onPressed: () {
                        setState(() {
                          currentScreen = Inicio();
                          currentTab = 0;
                        });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          color: currentTab == 0 ? Color(0xffffffff): Color(0x80ffffff),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                          child: Text(
                              'Início',
                            style:
                            TextStyle(
                              color: currentTab == 0 ?  Color(0xffffffff): Color(0x99ffffff),
                              fontFamily: 'Krub',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = Roteiros();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.tour_rounded,
                          color: currentTab == 1 ? Color(0xffffffff): Color(0x80ffffff)
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                          child: Text(
                            'Roteiros',
                            style: TextStyle(
                                color: currentTab == 1 ? Color(0xffffffff): Color(0x80ffffff),
                              fontFamily: 'Krub',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              //v Icons da bottom nav à direita v
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = Descobrir();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.explore_rounded,
                          color: currentTab == 3 ? Color(0xffffffff): Color(0x80ffffff)
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                          child: Text(
                            'Descobrir',
                            style: TextStyle(
                                color: currentTab == 3 ? Color(0xffffffff): Color(0x80ffffff),
                              fontFamily: 'Krub',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = Perfil();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_rounded,
                          color: currentTab == 4 ? Color(0xffffffff): Color(0x80ffffff)
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                          child: Text(
                            'Perfil',
                            style: TextStyle(
                                color: currentTab == 4 ? Color(0xffffffff): Color(0x80ffffff),
                              fontFamily: 'Krub',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

