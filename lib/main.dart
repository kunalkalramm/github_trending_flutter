import 'package:flutter/material.dart';
import 'package:githubtoprepos/pages/home_page.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
  },
));

