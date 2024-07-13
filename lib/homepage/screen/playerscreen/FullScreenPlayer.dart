import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class FullScreenPlayer extends StatelessWidget {
  final Map<String, String> tune;
  final VoidCallback onStop;
  final AudioPlayer audioPlayer;

  FullScreenPlayer({
    required this.tune,
    required this.onStop,
    required this.audioPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(tune['title']!, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: onStop,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                tune['imagePath']!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              tune['title']!,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              tune['artist']!,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(height: 20),
            StreamBuilder<Duration?>(
              stream: audioPlayer.positionStream,
              builder: (context, snapshot) {
                final duration = snapshot.data ?? Duration.zero;
                return Text(
                  "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.stop, color: Colors.white, size: 48),
              onPressed: onStop,
            ),
          ],
        ),
      ),
    );
  }
}
