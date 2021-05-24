import 'package:flutter_modular/flutter_modular.dart';
import 'package:basic_music/app/modules/player/player_store.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  final String title;
  const PlayerPage({Key? key, this.title = 'PlayerPage'}) : super(key: key);
  @override
  PlayerPageState createState() => PlayerPageState();
}
class PlayerPageState extends State<PlayerPage> {
  final PlayerStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tocando Musica'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(''))
              ),
            ),
          )
        ],
      ),
    );
  }
}