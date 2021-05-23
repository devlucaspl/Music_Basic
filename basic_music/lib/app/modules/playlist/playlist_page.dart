import 'package:flutter_modular/flutter_modular.dart';
import 'package:basic_music/app/modules/playlist/playlist_store.dart';
import 'package:flutter/material.dart';

class PlaylistPage extends StatefulWidget {
  final String title;
  const PlaylistPage({Key? key, this.title = 'PlaylistPage'}) : super(key: key);
  @override
  PlaylistPageState createState() => PlaylistPageState();
}
class PlaylistPageState extends State<PlaylistPage> {
  final PlaylistStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}