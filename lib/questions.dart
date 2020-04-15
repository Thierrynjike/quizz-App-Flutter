import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quizz/main.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => new _QuestionsState();
    // TODO: implement createState

  }

class Question {
  String question;
  bool reponse;
  String explication;
  String imagePath;

  Question(String question, bool reponse, String explication, String imagePath) {
    this.question = question;
    this.reponse = reponse;
    this.explication = explication;
    this.imagePath = imagePath;
  }
}


  class _QuestionsState extends State<Questions> {

  List<Question> listeQuestions = [
    new Question('La devise de la Belgique est l\'union fait la force', true, '', 'quizz assets/belgique.JPG'),
    new Question('La lune va finir par tomber sur terre à cause de la gravité', false, 'Au contraire la lune s\'éloigne', 'quizz assets/lune.jpg'),
    new Question('La Russie est plus grande en superficie que Pluton', true, '', 'quizz assets/russie.jpg'),
    new Question('Nyctalope est une race naine d\'antilope', false, 'C’est une aptitude à voir dans le noir', 'quizz assets/nyctalope.jpg'),
    new Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true, '', 'quizz assets/commodore.jpg'),
    new Question('Le nom du drapeau des pirates es black skull', false, 'Il est appelé Jolly Roger', 'quizz assets/pirate.png'),
    new Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou', 'quizz assets/tintin.jpg'),
    new Question('La barbe des pharaons était fausse', true, 'A l\'époque déjà ils utilisaient des postiches', 'quizz assets/pharaon.jpg'),
    new Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir', true, 'La bûche, fameuse chaise de bucheron', 'quizz assets/buche.jpg'),
    new Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true, 'Dire que je me plains avec mes 8GO de ram sur mon mac', 'quizz assets/eagle.jpg'),
  ];

  int index=0;
  int total= 10;
  int score=0;
  int numq=1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: new Text('Quizz'),
      ),

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('Question $numq',
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
            new Text('Scrore $score / $total',
              style: new TextStyle(
                color: Colors.white,
              ),

            ),
            new Card(
              elevation: 5.0,
              child: new Container (
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height /3,
                child: new Image.asset(listeQuestions[index].imagePath,
                  fit: BoxFit.cover,

                ),

              ),
            ),
            new Text(listeQuestions[index].question,
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              )

            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                    onPressed: vrai,
                    color: Colors.grey[900],
                    textColor: Colors.white,
                  child: new Text('Vrai',
                    style: new TextStyle(
                      color: Colors.white,
                    )

                  ),

                ),
                new RaisedButton(
                    onPressed: null,
                    color: Colors.grey[900],
                    child: new Text('Faux',
                      style: new TextStyle(
                        color: Colors.white,
                      )

                    ),
                )
              ],
             ),



          ],
        ),
      ),
      backgroundColor: Colors.grey[700],

    );

    }


    Future<Null> vrai() async {
      if(listeQuestions[index].reponse){
        return showDialog(
            context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text('Congratulations',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.green,

                  ),
                ),
                contentPadding: EdgeInsets.only(left:2.0,right:2.0,bottom: 2.0),
                content: new Image.asset('quizz assets/vrai.jpg'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        setState(() {
                          (index==listeQuestions.length-1) ? index=0 : index++;
                          score++;
                          numq++;
                          Navigator.pop(context);
                          (numq==11) ? Navigator.popUntil(context, ModalRoute.withName('/')) : new Questions();
                        });
                      },
                      child: new Text((index==listeQuestions.length-1) ? 'Terminé': 'Suivant')),

                ],
              );
          }
        );
      }
      else{
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text('Wrong Answer',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.red,

                  ),
                ),
                contentPadding: EdgeInsets.only(left:2.0,right:2.0,bottom: 2.0),
                content: new Image.asset('quizz assets/faux.jpg'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        setState(() {
                          (index==listeQuestions.length) ? index=0 : index++;

                          Navigator.pop(context);
                          (index!=listeQuestions.length) ? new Questions() : Navigator.popUntil(context, ModalRoute.withName('/'));
                          numq = index+1;
                        });
                      },
                      child: new Text((index==listeQuestions.length-1) ? 'Terminé': 'Suivant')),

                ],
              );
            }
        );
      }
    }

  }

