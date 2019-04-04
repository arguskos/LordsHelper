import 'package:flutter/material.dart';
import 'package:flutter_fun/models.dart';

class StateContainer extends StatefulWidget {
  final AppState state;
  //final TodosRepository repository;
  final Widget child;

  StateContainer({
    @required this.child,
    //TODO this may be needed in the future for saving or path to the netwrok
    // this.repository = const TodosRepositoryFlutter(
    //   fileStorage: const FileStorage(
    //     'inherited_widget_sample',
    //     getApplicationDocumentsDirectory,
    //   ),
    // ),
    this.state,
  });

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  State<StatefulWidget> createState() {
    return StateContainerState();
  }
}

class StateContainerState extends State<StateContainer> {
  AppState state;

  @override
  void initState() {
    super.initState();

    setState(() {
      state = AppState(
        players: [Player("Misha", false), Player("What ever", false)]
      );
    });
  }

  void nextPlayer()
  {
    setState(() {
      state.nextPlayer();
    });
  }

  void attack()
  {
    setState(() {
     state.attack();
    });
  }

  void select(LHero hero)
  {
    setState(() {
     state.select(hero); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // Note: we could get fancy here and compare whether the old AppState is
  // different than the current AppState. However, since we know this is the
  // root Widget, when we make changes we also know we want to rebuild Widgets
  // that depend on the StateContainer.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
