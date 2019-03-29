import 'package:flutter/material.dart';
import 'package:hello/game.dart';


enum DamageType { Physical, Magic }
enum HeroClass {
  Wizard,
  Archer,
  Assassin,
}

class BaseHero extends StatefulWidget {
  final DamageType damageType = DamageType.Magic;
  final String name;
  int maxHealth;
  int currentHealth;

  String enumName(Object o) {
    var text = damageType.toString();
    return text.substring(text.indexOf(".") + 1);
  }

  //BaseHero(this.name, this.maxHealth)

  BaseHero(this.name, this.maxHealth, {Key key}) : super(key: key) {
    currentHealth = maxHealth;
  }

  @override
  State<StatefulWidget> createState() {
    return _heroState();
  }
}

class _heroState extends State<BaseHero> {
  bool _pressed = false;

  _onTapUp(TapUpDetails details) {
    setState(() {
        final game = Game.of(context);
        game.nextPlayer();
        _pressed = false;
    });
  }

  _onTapDown(TapDownDetails det)
  {
    setState(() {
        _pressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTapDown: (TapDownDetails  t) => _onTapDown(t),
        onTapUp: (TapUpDetails  t) => _onTapUp(t),

        child: Container(
          decoration: new BoxDecoration(color: _pressed ? Colors.grey : Colors.white ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(widget.name),
                  Text(widget.enumName(this)),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(widget.currentHealth.toString()),
                  Text(widget.maxHealth.toString()),
                ],
              ),
            ],
          ),
        ));
  }
}

class Archer extends BaseHero {
  Archer() : super("Archer", 1000) {}
}

class Wizzard extends BaseHero {
  Wizzard() : super("Wizzard", 1000) {}
}
