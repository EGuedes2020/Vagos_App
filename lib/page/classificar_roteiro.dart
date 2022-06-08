import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vagos_app/page/ex_roteiro.dart';
import 'package:vagos_app/styles/my_icons.dart';

class ClassificarRoteiro extends StatefulWidget {
  const ClassificarRoteiro({Key key}) : super(key: key);

  @override
  _ClassificarRoteiroState createState() => _ClassificarRoteiroState();
}

class _ClassificarRoteiroState extends State<ClassificarRoteiro> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Classificar Roteiro'),
          ],
        ),
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
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.scale,
                            child: ExRoteiro(),
                          ),
                        );
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pop(context);
        },
        label: Text('PUBLICAR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Classifique o Roteiro', style: Theme.of(context).textTheme.headline5,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 50,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star_rounded, color: Theme.of(context).accentColor,),
                      half: Icon(Icons.star_half_rounded,color: Theme.of(context).accentColor,),
                      empty: Icon(Icons.star_outline_rounded, color: Theme.of(context).accentColor,),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ),


              Text('Deixe um Comentário', style: Theme.of(context).textTheme.headline5,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  maxLength: 500,
                  maxLines: 5,
                  minLines: 5,
                  //initialValue: 'Input text',
                  decoration: InputDecoration(
                    hintText: 'Descreve a tua experiência (opcional)',
                    //labelText: 'Título do Roteiro',
                    //errorText: 'Error message',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),


              Center(
                  child: Column(
                    children: [
                      Text('A tua opinião é importante!', style: Theme.of(context).textTheme.headline6,),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Partilha-a com outras pessoas', style: Theme.of(context).textTheme.subtitle1,),
                      ),

                      Container(
                        height: 300,
                        child: SvgPicture.asset(
                          classificar_cliente_boneco, height: 300,
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
