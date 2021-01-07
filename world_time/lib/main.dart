import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),      //display loading screen first when the app is loaded
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
