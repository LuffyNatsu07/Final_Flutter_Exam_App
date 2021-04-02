import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;

class Result extends StatefulWidget {
  Result(this.resultScore, this.resetHandler);


  final int resultScore;
  final Function resetHandler;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  FirebaseUser loggedInUser;

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser();
      if (user !=null){
        loggedInUser = user;
        print(loggedInUser);
      }
    }catch(e){
      print(e);
    }
  }

  void scores() async{
    await for (var snapshot in _firestore.collection('scores').snapshots()){
      print(snapshot);
    }
    //   print(snapshot.documents);
  }


  String get resultPhrase {
    String resultText;
    if (widget.resultScore >= 41) {
      resultText = 'You are awesome!';
      print(widget.resultScore);
    } else if (widget.resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(widget.resultScore);
    } else if (widget.resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (widget.resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(widget.resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '${widget.resultScore}',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          RaisedButton(
              child: Text(
                'Restart Quiz!',
              ),
            textColor: Colors.blue,
            onPressed: widget.resetHandler,
            ),
          RaisedButton(
            child: Text(
              'Upload!',
            ),
            textColor: Colors.blue,
            onPressed: (){
              _firestore.collection('scores').add({
                'Name': loggedInUser.email, 'score': widget.resultScore});
            },
          ),//Text
          //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
