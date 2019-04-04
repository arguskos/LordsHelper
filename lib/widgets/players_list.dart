import 'package:flutter/material.dart';
import 'package:flutter_fun/start_container.dart';
import 'package:flutter_fun/widgets/player_item.dart';

class PlayerList extends StatelessWidget {
  PlayerList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);

    return Container(
      child: container.state.isLoading
          ? _buildLoading
          : _buildList(context, container),
    );
  }

  Center get _buildLoading {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Row _buildList(BuildContext context, StateContainerState container) {
    final players = container.state.players;

    //TODO THERE MUST BE A BETTER WAY TO DO THIS
    return Row(
      //crossAxisAlignment:CrossAxisAlignment.stretch,
      children: <Widget>[
        PlayerItem(
          player: players[0],
          onTap: () {
            _nextPlayer(context);
          },
        ),
        PlayerItem(
          player: players[1],
          onTap: () {
            _nextPlayer(context);
          },
        )
      ],
    );

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
