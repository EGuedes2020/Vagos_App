import 'package:flutter/material.dart';
import 'home.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      initialRoute: '/inicio',

      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/inicio': (context) => MyApp(),
      },

       */

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt'),
      ],


      title: 'Vagos',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff1A9DD9),
        accentColor: Color(0xffFFD400),


        dividerColor: Colors.grey[350],
        cardColor: Colors.white,
        selectedRowColor: Colors.blue[50],//Color(0xff1A9DD9).withOpacity(0.08),
        shadowColor: Colors.black.withOpacity(0.8),  //sombras mais suaves »» também o faz nas provenientes do elevation
        backgroundColor: Color(0xfffafafa),

        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).accentColor.withOpacity(0.8),
          ),
          height: 20,
          padding: const EdgeInsets.all(9.0),
          preferBelow: false,
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          showDuration: const Duration(seconds: 2),
          waitDuration: const Duration(seconds: 4),
        ),


        //fontFamily: 'Ubuntu',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  98.0,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          headline2: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  61.0,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          headline3: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  49.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
          ),
          headline4: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  35.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headline5: TextStyle(   //diferente do default do material design
            fontFamily: 'Ubuntu',
            fontSize:  25.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.0,
          ),
          headline6: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  21.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  16.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize:  14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Krub',
            fontSize:  15.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Krub',
            fontSize:  13.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          button: TextStyle(
            fontFamily: 'Krub',
            fontSize:  14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: TextStyle(
            fontFamily: 'Krub',
            fontSize:  11.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          overline: TextStyle(
            fontFamily: 'Krub',
            fontSize:  10.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),


      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
