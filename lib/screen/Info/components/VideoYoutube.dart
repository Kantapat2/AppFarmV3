// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class VideoYoutube extends StatefulWidget {
//   String urlVDO;
//   VideoYoutube(
//       {String urlVDO =
//           'https://www.youtube.com/watch?v=3SEhUVLRhIg'}) {
//     this.urlVDO = urlVDO;
//   }
//   @override
//   _VideoYoutubeState createState() => _VideoYoutubeState(urlVDO);
// }

// class _VideoYoutubeState extends State<VideoYoutube> {
//   final String urlVDO;
//   _VideoYoutubeState(this.urlVDO);
//   YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId: urlVDO,//YoutubePlayer.convertUrlToId('$urlVDO'), // id youtube video //<-----------------!!!!!!!!!!
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: false,
//     ),
//     //   params: YoutubePlayerParams(
//     //     playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
//     //     startAt: Duration(seconds: 30),
//     //     showControls: true,
//     //     showFullscreenButton: true,
//     // ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: null,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD',
//             ),
//             YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: Colors.blueAccent,
//               bottomActions: [
//                 CurrentPosition(),
//                 ProgressBar(isExpanded: true),
//                 RemainingDuration(),
//               ],
              
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }