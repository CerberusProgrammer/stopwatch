import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(useMaterial3: true),
    title: 'Stop Watch',
    home: const Home(),
  ));
}
