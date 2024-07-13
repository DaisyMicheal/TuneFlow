import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'playerscreen/BottomPlayer.dart';
import 'playerscreen/MiniPlayer.dart';

class RecentTunes extends StatefulWidget {
  @override
  _RecentTunesState createState() => _RecentTunesState();
}

class _RecentTunesState extends State<RecentTunes> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _selectedIndex = -1;
  Map<String, String>? _currentTune;

  final List<Map<String, String>> _recentTunes = [
    {
      'title': 'Cruel Summer',
      'artist': 'Taylor Swift',
      'duration': '3:00',
      'imagePath': 'assets/taylor.jpg',
      'audioUrl': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Paint Town Red',
      'artist': 'Doja Cat',
      'duration': '2:00',
      'imagePath': 'assets/ella.jpg',
      'audioUrl': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Shiver',
      'artist':'EdSheeran' ,
      'duration': '2:00',
      'imagePath': 'assets/EdSheeran.jpg',
      'audioUrl': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Paint Town Red',
      'artist': 'Doja Cat',
      'duration': '2:00',
      'imagePath': 'assets/ella.jpg',
      'audioUrl': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Commas',
      'artist': 'Ayra Starr',
      'duration': '2:00',
      'imagePath': 'assets/ayra.jpg',
      'audioUrl': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Santa',
      'artist': 'Araina Grande',
      'duration': '2:00',
      'imagePath': 'assets/araina.jpg',
      'audioUrl': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
  ];

  void _playTune(int index) async {
    final tune = _recentTunes[index];
    setState(() {
      _selectedIndex = index;
      _currentTune = tune;
    });

    try {
      await _audioPlayer.setUrl(tune['audioUrl']!);
      _audioPlayer.play();

      // Show the BottomMusicPlayer immediately
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return BottomMusicPlayer(
              tune: _currentTune!,
              onStop: _stopTune,
              audioPlayer: _audioPlayer,
              onMinimize: _showMiniPlayer,
            );
          },
        ).whenComplete(() {
          // Show mini player when modal is dismissed
          setState(() {});
        });
      });
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  void _showMiniPlayer() {
    Navigator.of(context).pop();
    setState(() {});
  }

  void _stopTune() {
    setState(() {
      _selectedIndex = -1;
      _currentTune = null;
    });
    _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recently Played',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: _recentTunes.asMap().entries.map((entry) {
                final index = entry.key;
                final tune = entry.value;
                return GestureDetector(
                  onTap: () => _playTune(index),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Stack(
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
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Center(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tune['title']!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                tune['artist']!,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          tune['duration']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        if (_currentTune != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: MiniPlayer(
              tune: _currentTune!,
              onStop: _stopTune,
              audioPlayer: _audioPlayer,
              onExpand: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return BottomMusicPlayer(
                      tune: _currentTune!,
                      onStop: _stopTune,
                      audioPlayer: _audioPlayer,
                      onMinimize: _showMiniPlayer,
                    );
                  },
                ).whenComplete(() {
                  // Show mini player when modal is dismissed
                  setState(() {});
                });
              },
            ),
          ),
      ],
    );
  }
}
