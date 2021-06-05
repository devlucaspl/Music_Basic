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
  final String music;
  const PlayerPage({Key? key,
    this.url = 'Tocando Musica',
    this.music = 'http://192.168.0.110:8096/emby/Audio/168/universal?UserId=866b0872c43e40f9a5482182f739d907&DeviceId=e839f2c1-c9b0-4c24-97f8-5ca8fe601ebf&MaxStreamingBitrate=140000000&Container=opus%2Cmp3%7Cmp3%2Cmp2%2Cmp3%7Cmp2%2Caac%7Caac%2Cm4a%7Caac%2Cmp4%7Caac%2Cflac%2Cwebma%2Cwebm%2Cwav%7CPCM_S16LE%2Cogg&TranscodingContainer=aac&TranscodingProtocol=hls&AudioCodec=aac&api_key=f3ea9cc7f3c2430f902586661b426d32&PlaySessionId=1622869805590&StartTimeTicks=0&EnableRedirection=true'}) : super(key: key);
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
                arguments: "http://192.168.0.110:8096/emby/Items/168/Images/Primary?tag=1ac1cefcb6208caa4ace7bf29efb12a2&quality=90"),
            leading: Image.network('http://192.168.0.110:8096/emby/Items/168/Images/Primary?tag=1ac1cefcb6208caa4ace7bf29efb12a2&quality=90'),
            title: Text(
                'Cada Minuto',
                style: GoogleFonts.notoSans()),
            subtitle: Text(
                'Scalene',
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
          child: Text('Cada Minuto',
            style: GoogleFonts.notoSans(
                fontSize: 25,
                fontWeight: FontWeight.bold)),

        ),
        Container(
          child: Text('Scalene',
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
                    onPressed: (){

                    },
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


