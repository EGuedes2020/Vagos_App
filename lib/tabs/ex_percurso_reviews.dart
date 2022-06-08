import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class ExPercursoReviews extends StatefulWidget {
  const ExPercursoReviews({Key key}) : super(key: key);

  @override
  _ExPercursoReviewsState createState() => _ExPercursoReviewsState();
}

class _ExPercursoReviewsState extends State<ExPercursoReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(

            children: [
              //PARTE DE CIMA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  //CLASSIFICAÇÃO GERAL
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('4,0', style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontFamily: 'Krub', color: Colors.grey[900])),),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                            Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                            Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                            Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                            Icon (Icons.star_rate_rounded, size: 16, color: Colors.grey[400]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text('120', style: Theme.of(context).textTheme.caption,),
                      ),
                    ],
                  ),

                  //BARRAS COM AS PERCENTAGENS
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: [
                              Text('5', style: Theme.of(context).textTheme.caption,),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: new LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  width: 150.0,
                                  lineHeight: 8.0,
                                  percent: 0.7,
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('5', style: Theme.of(context).textTheme.caption,),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: new LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  width: 150.0,
                                  lineHeight: 8.0,
                                  percent: 0.2,
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('3', style: Theme.of(context).textTheme.caption,),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: new LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  width: 150.0,
                                  lineHeight: 8.0,
                                  percent: 0.05,
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('4', style: Theme.of(context).textTheme.caption,),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: new LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  width: 150.0,
                                  lineHeight: 8.0,
                                  percent: 0.04,
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('1', style: Theme.of(context).textTheme.caption,),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: new LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  width: 150.0,
                                  lineHeight: 8.0,
                                  percent: 0.01,
                                  progressColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),

                ],
              ),

              //meter os comentários
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                           'assets/imagens/perfil_rodrigo_campos.jpg')
                                    )
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Rodrigo Campos',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text('27/04/2021', style: Theme.of(context).textTheme.caption,),
                              ),
                            ],
                          ),
                        ),
                        Text('É muito bom para quem quer conhecer os pontos religiosos desta zona a pé. Fiz este percurso com a minha família e foi bastante agradável.', style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            'assets/imagens/perfil_rodrigo_campos.jpg')
                                    )
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Rodrigo Campos',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text('27/04/2021', style: Theme.of(context).textTheme.caption,),
                              ),
                            ],
                          ),
                        ),
                        Text('É muito bom para quem quer conhecer os pontos religiosos desta zona a pé. Fiz este percurso com a minha família e foi bastante agradável.', style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            'assets/imagens/perfil_rodrigo_campos.jpg')
                                    )
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Rodrigo Campos',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text('27/04/2021', style: Theme.of(context).textTheme.caption,),
                              ),
                            ],
                          ),
                        ),
                        Text('É muito bom para quem quer conhecer os pontos religiosos desta zona a pé. Fiz este percurso com a minha família e foi bastante agradável.', style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            'assets/imagens/perfil_rodrigo_campos.jpg')
                                    )
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Rodrigo Campos',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text('27/04/2021', style: Theme.of(context).textTheme.caption,),
                              ),
                            ],
                          ),
                        ),
                        Text('É muito bom para quem quer conhecer os pontos religiosos desta zona a pé. Fiz este percurso com a minha família e foi bastante agradável.', style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 80),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new AssetImage(
                                            'assets/imagens/perfil_rodrigo_campos.jpg')
                                    )
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Rodrigo Campos',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Icon (Icons.star_rate_rounded, size: 16, color: Theme.of(context).primaryColor,),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text('27/04/2021', style: Theme.of(context).textTheme.caption,),
                              ),
                            ],
                          ),
                        ),
                        Text('É muito bom para quem quer conhecer os pontos religiosos desta zona a pé. Fiz este percurso com a minha família e foi bastante agradável.', style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
