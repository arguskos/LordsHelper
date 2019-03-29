import 'package:flutter/material.dart';
import 'package:hello/heroes.dart';


class Player extends StatefulWidget {
  var _heroes = <BaseHero>[];
  bool isCurrentPlayer = false;

  //BaseHero(this.name, this.maxHealth)

  Player({Key key}) : super(key: key) {
    _heroes.add(Archer());
    _heroes.add(Wizzard());

  }

  @override
  State<StatefulWidget> createState() {
    return _playerState();
  }
}

class _playerState extends State<Player> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: new BoxDecoration(
            color: widget.isCurrentPlayer ? Colors.grey : Colors.white
            
          ),
          child: 
            ListView.builder(
              itemCount:  widget._heroes.length,
              itemBuilder: (context, i ) {
              return(widget._heroes[i]);
              }
        )
        
        )
    );  
  }
}