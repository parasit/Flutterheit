import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'models/monster.dart';

class BeastCardDetails extends StatelessWidget {
  final Monster beast;
  // final String label;

  const BeastCardDetails({
    Key? key,
    required this.beast,
  }) : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          beast.name,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/paper_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              MyTextRow(title: "", value: beast.meta),
              MyTextRow(title: "Armor class ", value: beast.armorClass),
              MyTextRow(title: "Hit Points ", value: beast.hitPoints),
              MyTextRow(title: "Speed ", value: beast.speed),
              Wrap(
                spacing: 100,
                children: [
                  MyTextColumn(title: "STR", value: beast.str + beast.str_mod),
                  MyTextColumn(title: "DEX", value: beast.dex + beast.dex_mod),
                  MyTextColumn(title: "CON", value: beast.con + beast.con_mod),
                  MyTextColumn(
                      title: "INT",
                      value: beast.inteligence + beast.inteligence_mod),
                  MyTextColumn(title: "WIS", value: beast.wis + beast.wis_mod),
                  MyTextColumn(title: "CON", value: beast.cha + beast.cha_mod),
                ],
              ),
              MyTextRow(title: "Skills ", value: beast.skills),
              MyTextRow(title: "Senses ", value: beast.senses),
              MyTextRow(title: "Languages ", value: beast.languages),
              MyTextRow(title: "Challenge ", value: beast.challenge),
              Html(data: beast.traits),
              Html(data: beast.actions),
              Html(data: beast.legendaryActions),
              Image.network(beast.img_url),
            ]),
          ),
        ),
      ),
    );
  }
}

class MyTextRow extends StatelessWidget {
  final String title;
  final String value;

  const MyTextRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value)
      ],
    );
  }
}

class MyTextColumn extends StatelessWidget {
  final String title;
  final String value;

  const MyTextColumn({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        Text(value, textAlign: TextAlign.center)
      ],
    );
  }
}
