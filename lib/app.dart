// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_fun/screens/home_screen.dart';

class InheritedWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lords",
      // localizationsDelegates: [
      //   ArchSampleLocalizationsDelegate(),
      //   InheritedWidgetLocalizationsDelegate(),
      // ],
      routes: {
        '/': (context) => HomeScreen()
      },
    );
  }
}
