import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title : Center(
             child : Text("Rock Paper Scissor"),
          ),
          backgroundColor: Colors.black,
        ),
        body: Game(),
      ),
    ),
  );
}

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  
  List<String> control = ['rock','paper','scissor'];
  int user_c = -1;
  int computer_c = -1;

  int user_score = 0;
  int computer_score = 0;

  void checkScore(){
    if(user_c == 0){
      if(computer_c == 1){
        computer_score++;
      }else if(computer_c == 2){
        user_score++;
      }
    }else if(user_c == 1 ){
      if(computer_c == 2){
        computer_score++;
      }else if(computer_c == 0){
        user_score++;
      }
    }else if(user_c == 2){
      if(computer_c == 0){
        computer_score++;
      }else if(computer_c == 1){
        user_score++;
      }
    }
  }

  Widget getText(){
    if(user_c == -1 && computer_c == -1){
      return Text(
        "Welcome to the game".toUpperCase(),
        style: TextStyle(
          color : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      );
    }else{
      return Text(
        "(USER) " +  control[user_c][0].toUpperCase() + control[user_c].substring(1) + " v/s " + control[computer_c][0].toUpperCase() + control[computer_c].substring(1) + " (PC)",
        style: TextStyle(
          color : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
          getText(),
          Text(
            user_score.toString() + " : " + computer_score.toString(),
            style: TextStyle(
              fontSize : 60.0,
              fontWeight : FontWeight.bold,
              color : Colors.grey.shade700,
              letterSpacing: 2.0
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      user_c = 0;
                      computer_c = Random().nextInt(3);
                      checkScore();
                    });
                  }, 
                  child: Text(
                    "Rock",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      user_c = 1;
                      computer_c = Random().nextInt(3);
                      checkScore();
                    });
                  }, 
                  child: Text(
                    "Paper",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      user_c = 2;
                      computer_c = Random().nextInt(3);
                      checkScore();
                    });
                  }, 
                  child: Text(
                    "Scissor",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}