import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MiniPlayer extends StatelessWidget {
  final Map<String, String> tune;
  final VoidCallback onStop;
  final AudioPlayer audioPlayer;
  final VoidCallback onExpand;

  MiniPlayer({
    required this.tune,
    required this.onStop,
    required this.audioPlayer,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onExpand,
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                tune['imagePath']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tune['title']!,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    tune['artist']!,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            StreamBuilder<PlayerState>(
              stream: audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing ?? false;
                if (playing != true) {
                  return IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.white),
                    onPressed: audioPlayer.play,
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                    icon: Icon(Icons.pause, color: Colors.white),
                    onPressed: audioPlayer.pause,
                  );
                }
                return IconButton(
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                  onPressed: audioPlayer.play,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: onStop,
            ),
          ],
        ),
      ),
    );
  }
}
