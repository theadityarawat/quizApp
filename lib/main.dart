import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionrep.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const quiz());
}

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  List<Icon> score = [];
  Rep quiz = Rep();
  void checkanswer(String useranswer) {
    setState(() {
      String correctAnswer = quiz.getquestionanswer();
      if (correctAnswer == useranswer) {
        score.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        Alert(
          context: context,
          type: AlertType.error,
          title: "RFLUTTER ALERT",
          desc: "Flutter is more awesome with RFlutter Alert.",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else
        score.add(Icon(
          Icons.close,
          color: Colors.red,
        ));

      quiz.incqno();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Quiz",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Divider(
              color: Colors.white,
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      quiz.getquestiontext(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
              flex: 7,
            ), //TODO Write Q
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        checkanswer('A');
                      },
                      height: 80,
                      minWidth: 260,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(18)),
                      highlightColor: Colors.cyanAccent,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Text(
                        "B",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        checkanswer('B');
                      },
                      height: 80,
                      minWidth: 260,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(18)),
                      highlightColor: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            ), //TODO Write options A,B
            SizedBox(
              height: 20,
            ), //Gap between AB and CD
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Text(
                        "C",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        checkanswer('C');
                      },
                      height: 80,
                      minWidth: 260,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(18)),
                      highlightColor: Colors.cyanAccent,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Text(
                        "D",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        checkanswer('D');
                      },
                      height: 80,
                      // minWidth: 260,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(18)),
                      highlightColor: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            ), //TODO Write options C,D
            Row(
              children: score,
            )
          ],
        ),
      ),
    );
  }
}
