import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'models/monster.dart';

class BeastCard extends StatelessWidget {
  final Monster beast;
  // final String label;

  const BeastCard({
    Key? key,
    required this.beast,
    required onTap,
  }) : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/paper_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage("assets/images/paper_bar.png"),
            ),
          ]),
          Row(
            children: [
              Text(beast.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              // Padding(padding: EdgeInsets.only(top: 10, left: 10, right: 10)),
              Spacer(),
              Text(beast.meta),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Chalenge: " + beast.challenge,
                style: TextStyle(fontWeight: FontWeight.w500)),
            // Html(data: beast.traits),
            // Image.network(beast.img_url),
          ]),
        ],
      ),
    );
  }
}
