import 'package:flutter/material.dart';
import 'package:flutterheit/beastCard.dart';
import 'package:flutterheit/filteredMonsterList.dart';
import 'package:flutterheit/models/monster.dart';
// import 'package:flutterheit/models/monster.dart';
import 'package:flutterheit/models/players.dart';
import 'package:flutterheit/playerCard.dart';
import 'package:flutterheit/searchBar.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutterheit',
      home: HomePage(),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Flutterheit',
        ),
      ),
      body: Column(children: [
        Expanded(child: FilterMonsterListPage()),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightGreen,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_card), label: "Add Monster")
        ],
      ),
    );
  }
}
