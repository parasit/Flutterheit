import 'package:flutter/material.dart';

import 'models/players.dart';

class PlayerCard extends StatelessWidget {
  final Player gracz;
  const PlayerCard({Key? key, required this.gracz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(gracz.name, style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
