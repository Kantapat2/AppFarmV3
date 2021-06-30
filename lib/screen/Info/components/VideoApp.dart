import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  String urlVDO;
  VideoApp(
      {String urlVDO =
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'}) {
    this.urlVDO = urlVDO;
  }
  @override
  _VideoAppState createState() => _VideoAppState(urlVDO: urlVDO);
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  Duration videoLength;
  Duration videoPosition;
  double volume = 0.5;

  String urlVDO;

  _VideoAppState({String urlVDO}) {
    this.urlVDO = urlVDO;
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(urlVDO)
      ..addListener(() => setState(() {
            videoPosition = _controller.value.position;
          }))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          videoLength = _controller.value.duration;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_controller.value.initialized) ...[
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            padding: EdgeInsets.all(10),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () => setState(
                  () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  },
                ),
              ),
              Text(
                  '${convertToMinutesSeconds(videoPosition)} / ${convertToMinutesSeconds(videoLength)}'),
              SizedBox(width: 10),
              Icon(animatedVolumeIcon(volume)),
              Expanded(
                child: Slider(
                    value: volume,
                    min: 0,
                    max: 1,
                    onChanged: (changedVolume) {
                      setState(() {
                        volume = changedVolume;
                        _controller.setVolume(changedVolume);
                      });
                    }),
              ),
              /* Spacer(),
                    IconButton(
                      tooltip: 'loop',
                        icon: Icon(Icons.loop,
                            color: _controller.value.isLooping
                                ? Colors.green
                                : Colors.black),
                        onPressed: () {
                          _controller.setLooping(!_controller.value.isLooping);
                        })
                        */
            ],
          ),
        ] else ...[
          // image loading here
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                border: Border.all(),
              ),

              //color:Colors.blue[200],
              //margin: EdgeInsets.all(100),
              alignment: Alignment(0.0, 0.0),
              //alignment: Alignment.center,
              child:
              CircularProgressIndicator() 
              // Text(
              //   'Loadind ...',
              //   style: TextStyle(fontSize: 20, color: Colors.grey),
              // ),
            ),
          )
        ]
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes % 60;

  final minutes =
      parsedMinutes < 10 ? '0$parsedMinutes' : parsedMinutes.toString();

  final parsedSeconds = duration.inSeconds % 60;

  final seconds =
      parsedSeconds < 10 ? '0$parsedSeconds' : parsedSeconds.toString();

  return '$minutes:$seconds';
}

IconData animatedVolumeIcon(double volume) {
  if (volume == 0)
    return Icons.volume_mute;
  else if (volume < 0.5)
    return Icons.volume_down;
  else
    return Icons.volume_up;
}

/*
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; //เพิ่ม ค่าใน info ของ ios ด้วย ** https://pub.dev/packages/youtube_player_flutter

class VideoApp extends StatefulWidget {
  VideoApp();
   
  @override
  State<StatefulWidget> createState() {
    return _VideoApp();
  }
}

class _VideoApp extends State<VideoApp> {
  String videoUrl =
      "https://www.youtube.com/watch?v=R8hgEnKHXVg&list=RDLKbzXBEU-lg&index=15";

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: _controller,
            )
          ],
        ),
      ),
    );
  }
}
*/
