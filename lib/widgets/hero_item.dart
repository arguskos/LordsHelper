// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fun/models.dart';

//TODO investigate wheather this should be stateless or statefull
class HeroItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final LHero hero;

  HeroItem({
    @required this.onTap,
    @required this.hero,
  });

  


  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: Text(
         hero.toString()
        ),
        subtitle: Row(
              children: <Widget>[
                  Text(hero.currentHealth.toString()),
                  Text(hero.maxHealth.toString()),
              ],    
                  ),
    );
  }
}
