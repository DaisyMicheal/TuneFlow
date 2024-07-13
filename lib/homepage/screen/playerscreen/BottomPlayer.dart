import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BottomMusicPlayer extends StatefulWidget {
  final Map<String, String> tune;
  final VoidCallback onStop;
  final AudioPlayer audioPlayer;
  final VoidCallback onMinimize;

  BottomMusicPlayer({
    required this.tune,
    required this.onStop,
    required this.audioPlayer,
    required this.onMinimize,
  });

  @override
  _BottomMusicPlayerState createState() => _BottomMusicPlayerState();
}

class _BottomMusicPlayerState extends State<BottomMusicPlayer> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    isPlaying = widget.audioPlayer.playing;
  }

  void togglePlayPause() {
    setState(() {
      if (isPlaying) {
        widget.audioPlayer.pause();
      } else {
        widget.audioPlayer.play();
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.expand_more, color: Colors.white),
                onPressed: widget.onMinimize,
              ),
              Text(
                'Now Playing',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            width: 300,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                widget.tune['imagePath']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            widget.tune['title']!,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.tune['artist']!,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  // Implement favorite logic here
                },
              ),
              IconButton(
                icon: Icon(Icons.shuffle, color: Colors.white),
                onPressed: () {
                  // Implement shuffle logic here
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white),
                onPressed: () {
                  // Implement previous track logic here
                },
              ),
              IconButton(
                icon: isPlaying
                    ? Icon(Icons.pause_circle_filled,
                        color: Colors.white, size: 48)
                    : Icon(Icons.play_circle_filled,
                        color: Colors.white, size: 48),
                onPressed: togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white),
                onPressed: () {
                  // Implement next track logic here
                },
              ),
              IconButton(
                icon: Icon(Icons.repeat, color: Colors.white),
                onPressed: () {
                  // Implement repeat logic here
                },
              ),
            ],
          ),
          Slider(
            value: widget.audioPlayer.position.inSeconds.toDouble(),
            min: 0,
            max: widget.audioPlayer.duration?.inSeconds.toDouble() ?? 0,
            onChanged: (value) {
              widget.audioPlayer.seek(Duration(seconds: value.toInt()));
            },
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
