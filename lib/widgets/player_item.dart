// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fun/widgets/hero_list.dart';
import 'package:flutter_fun/models.dart';

class PlayerItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Player player;

  PlayerItem({
    @required this.onTap,
    @required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: onTap,
            child: Container(
                decoration: new BoxDecoration(
                    color: player.isActive ? Colors.red : Colors.white),
                child: Column(
                  children: <Widget>[
                    Text(
                      player.playerName,
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: HeroList(player))
                  ],
                ))
            //  Container(
            //     decoration: new BoxDecoration(
            //         color: player.isActive ? Colors.red : Colors.grey),
            //     child: Column(
            //       children: <Widget>[
            //         // Text(
            //         //   player.playerName,
            //         //   textAlign: TextAlign.center,
            //         // ),

            //       ],
            //     )),
            ));
  }
}
