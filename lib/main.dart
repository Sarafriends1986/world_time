import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {

      // ignore: missing_return
      '/': (context) => Loading(),
      // ignore: missing_return
      '/home': (context) => Home(),
      // ignore: missing_return
      '/location': (context) => ChooseLocation(),
    }
  ));
}
