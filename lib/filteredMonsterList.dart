import 'package:flutter/material.dart';
import 'package:flutterheit/beastCard.dart';
import 'package:flutterheit/beastCardDetails.dart';
import 'package:flutterheit/models/monster.dart';
import 'package:flutterheit/models/players.dart';
import 'package:flutterheit/searchBar.dart';

class FilterMonsterListPage extends StatefulWidget {
  @override
  FilterMonsterListPageState createState() => FilterMonsterListPageState();
}

class FilterMonsterListPageState extends State<FilterMonsterListPage> {
  List<Player> company = [];
  List<Monster> bestiary = []; // all monsters
  List<Monster> monsters = []; // current/filtered monsters
  String query = '';

  @override
  void initState() {
    print("Init state monsters list");
    super.initState();
    // loadPlayers().then((value) {
    //   setState(() {
    //     company.addAll(value);
    //   });
    // });

    loadBestiary().then((value) {
      setState(() {
        bestiary.addAll(value);
        monsters.addAll(value);
      });
    });
  }

  void searchMonster(String query) {
    final monsters = bestiary.where((monster) {
      final nameLower = monster.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.monsters = monsters;
    });
  }

  Widget buildSearch() => SearchBar(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchMonster,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        buildSearch(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(monsters[index].name),
                  subtitle: Text(monsters[index].meta),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BeastCardDetails(beast: monsters[index]),
                      ),
                    );
                  });
            },
            itemCount: monsters.length,
          ),
        ),
      ]),
    );
  }
}
