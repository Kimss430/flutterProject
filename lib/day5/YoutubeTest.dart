import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : YoutubeTest()
    );
  }
}


class YoutubeTest extends StatefulWidget {
  @override
  State<YoutubeTest> createState() => _TestViewState();
}

class _TestViewState extends State<YoutubeTest> {
  // static String youtubeId = ''; 이부분의 값은 유튜브 영상 들어가서
  static String youtubeId = 'ixHdKkpBKoo';

  final YoutubePlayerController _con = YoutubePlayerController(
    initialVideoId: youtubeId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("유튜브 영상!"),
      ),
      body: YoutubePlayer(
        controller: _con,
      ),
    );
  }
}