// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_fun/app.dart';
import 'package:flutter_fun/main.dart';
import 'package:flutter_fun/widgets/players_list.dart';

import 'package:flutter_fun/start_container.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen() : super();

  @override  
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  //AppTab activeTab = AppTab.todos;

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    final state = container.state;

    return Scaffold(
      appBar: AppBar(
        title:  Text('Lords'),
      ),
      body: Container(
        child: PlayerList()
      )
    );
  }

  // _updateTab(AppTab tab) {
  //   setState(() {
  //     activeTab = tab;
  //   });
  //}
}
