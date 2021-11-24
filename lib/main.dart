import 'package:flutter/material.dart';
import 'package:prova02/home.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Prova 02 - Login',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Home()),
      ),
    );
  }
}
