import 'package:flutter/material.dart';
  
class Game extends InheritedWidget {
  Game(child, {
    Key key,
    }) 
      :assert(child != null),
       super(key: key, child: child);

  int currentActivePlayer = 0;
  int numberOfPlayers = 2;

  static Game of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Game) as Game;
  }

  void nextPlayer() {
    currentActivePlayer++;
    print(currentActivePlayer.toString());
  }

  @override
  bool updateShouldNotify(Game old) => currentActivePlayer != old.currentActivePlayer;
}