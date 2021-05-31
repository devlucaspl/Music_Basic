import 'package:flutter/painting.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:basic_music/app/modules/playlist/playlist_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistPage extends StatefulWidget {
  final String title;
  const PlaylistPage({Key? key, this.title = 'PlaylistPage'}) : super(key: key);
  @override
  PlaylistPageState createState() => PlaylistPageState();
}

class PlayerPage extends StatefulWidget {
  final String url;
  const PlayerPage({Key? key, this.url = 'Tocando Musica'}) : super(key: key);
  @override
  PlayerPageState createState() => PlayerPageState();
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
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, int index){
          return ListTile(
            onTap: () => Modular.to.pushNamed('/player',
                arguments: "http://192.168.0.108:8096/emby/Items/228/Images/Primary?maxHeight=800&maxWidth=800&tag=c499c6150303b9eabc54e0092cb37882&quality=90"),
            leading: Image.network('http://192.168.0.108:8096/emby/Items/232/Images/Backdrop/0?tag=57a09dfc97708618e7451f2a180c7973&maxWidth=1300&quality=70'),
            title: Text(
                'Californication',
                style: GoogleFonts.notoSans()),
            subtitle: Text(
                'Red Hot Chili Peppers',
                style: GoogleFonts.notoSans()),
            contentPadding: EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}

class PlayerPageState extends State<PlayerPage> {
  final PlayerStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          buildImageHeader(),
          buildNameMusic(),
          buildProgessBar(),
          buildButtons(),
        ],
      ),
    );
  }

  Container buildImageHeader(){
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 350,
          decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.url), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                blurRadius: 15,
                offset: Offset(5,5),
              )
            ]
          ),
        )
    );
  }

  buildNameMusic(){
    return Column(
      children: [
        Container(
          child: Text('Californication',
            style: GoogleFonts.notoSans(
                fontSize: 25,
                fontWeight: FontWeight.bold)),

        ),
        Container(
          child: Text('Red Hot Chili Peppers',
              style: GoogleFonts.notoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),

        ),
      ],
    );
  }

  buildProgessBar(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            value: 0.2,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Row(
            children: <Widget>[
              Text('0:15'),
              Expanded(child: Container()),
              Text('2:00')
            ],
          ),
        )
      ],
    );
  }

  buildButtons(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          TextButton(
              onPressed: (){

              },
              child: Icon(
                Icons.fast_rewind,
                size: 70,
                color: Colors.white,
              ),
          ),
          Expanded(
            child: TextButton(
                    onPressed: (){},
              child: Icon(
                Icons.play_circle_fill,
                size: 70,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: (){

            },
            child: Icon(
              Icons.fast_forward,
              size: 70,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }

}


