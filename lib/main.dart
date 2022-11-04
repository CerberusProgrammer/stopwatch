import 'package:flutter/material.dart';
import 'home.dart';

MaterialColor mycolor = MaterialColor(
  const Color.fromARGB(255, 0, 0, 0).value,
  const <int, Color>{
    50: Color.fromARGB(255, 0, 0, 0),
    100: Color.fromARGB(255, 0, 0, 0),
    200: Color.fromARGB(255, 0, 0, 0),
    300: Color.fromARGB(255, 0, 0, 0),
    400: Color.fromARGB(255, 0, 0, 0),
    500: Color.fromARGB(255, 0, 0, 0),
    600: Color.fromARGB(255, 0, 0, 0),
    700: Color.fromARGB(255, 0, 0, 0),
    800: Color.fromARGB(255, 0, 0, 0),
    900: Color.fromARGB(255, 0, 0, 0),
  },
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: mycolor,
      useMaterial3: true,
    ),
    title: 'Stop Watch',
    home: const Home(),
  ));
}
