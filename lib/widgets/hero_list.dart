import 'package:flutter/material.dart';
import 'package:flutter_fun/start_container.dart';
import 'package:flutter_fun/widgets/hero_item.dart';
import 'package:flutter_fun/models.dart';

class HeroList extends StatelessWidget {
  //TODO Should this even have a connection to model??
  //Probable should not but how to recieve heroes ?
  Player player;
  HeroList(this.player, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);

    return Container(
      child: container.state.isLoading
          ? _buildLoading
          : _buildList(context, player, container),
    );
  }

  Center get _buildLoading {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView _buildList(BuildContext context, Player player, StateContainerState contianer) {
    final heroes = player.heroes;
    //return Text('sadasdas');
    //TODO THERE MUST BE A BETTER WAY TO DO THIS
    return ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: new BoxDecoration(
                    color: heroes[index].selected ? Colors.blue : Colors.white),
              child: HeroItem(
                  hero: heroes[index],
                  onTap: () {
                    contianer.select(heroes[index]);
                  }));
        });
    //     ListView.builder(
    //   //key: ArchSampleKeys.todoList,
    //   itemCount: players.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     final player = players[index];
    //     return PlayerItem(
    //       player: player,
    //       onTap: () {
    //         _nextPlayer(context);
    //       },
    //     );
    //   },
    // );
  }

  void _nextPlayer(BuildContext context) {
    print('clicked');
    StateContainer.of(context).nextPlayer();
  }
}
