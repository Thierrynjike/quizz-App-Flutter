import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.grey[900],
        title: Text('Quizz Vrai ou Faux',
        textAlign: TextAlign.center),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Card(
              child: new Container(
                width: MediaQuery.of(context).size.height/2.5,
                height: MediaQuery.of(context).size.height/3,
                child: new Image.asset('quizz assets/cover.jpg',
                  fit: BoxFit.fill,


                ),

              )
            ),

            new RaisedButton(
                color: Colors.black,
                textColor: Colors.white,
                onPressed: lancer,
                child: new Text('Commencer le Quizz',
                  textScaleFactor: 1.5,
                  style: new TextStyle(
                    color: Colors.white,

                  )
                ),

            )

          ],
        ),
      ),
      backgroundColor: Colors.grey[600],

    );

    }
    void lancer() {
      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
        return new Questions();
      }));

  }
}
