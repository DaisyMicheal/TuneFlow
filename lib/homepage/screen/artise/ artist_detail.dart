import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ArtistDetailPage extends StatefulWidget {
  final String artistName;
  final String artistImagePath;
  final String monthlyListeners;
  final List<Map<String, String>> popularSongs;

  ArtistDetailPage({
    required this.artistName,
    required this.artistImagePath,
    required this.monthlyListeners,
    required this.popularSongs,
  });

  @override
  _ArtistDetailPageState createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  bool isFollowing = false;
  AudioPlayer _audioPlayer = AudioPlayer();
  int _currentPlayingIndex = -1;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSong(int index) async {
    final song = widget.popularSongs[index];
    await _audioPlayer.setUrl(song[
        'url']!); // Make sure your song data contains the 'url' key with the song URL
    _audioPlayer.play();
    setState(() {
      _currentPlayingIndex = index;
    });
  }

  void _pauseSong() {
    _audioPlayer.pause();
    setState(() {});
  }

  void _resumeSong() {
    _audioPlayer.play();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        widget.artistImagePath,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      widget.artistName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${widget.monthlyListeners} monthly listeners',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.play_circle_filled,
                              size: 64, color: Colors.green),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.shuffle,
                              size: 30, color: Colors.white),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isFollowing = !isFollowing;
                            });
                          },
                          icon: Icon(
                            isFollowing ? Icons.check : Icons.add,
                            color: Colors.white,
                          ),
                          label: Text(
                            isFollowing ? 'Following' : 'Follow',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.more_horiz, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Popular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.popularSongs.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    onEnter: (_) => setState(() {
                      widget.popularSongs[index]['hovered'] = 'true';
                    }),
                    onExit: (_) => setState(() {
                      widget.popularSongs[index]['hovered'] = 'false';
                    }),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            widget.popularSongs[index]['imagePath']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          if (widget.popularSongs[index]['hovered'] == 'true' ||
                              _currentPlayingIndex == index)
                            Icon(
                              _audioPlayer.playing &&
                                      _currentPlayingIndex == index
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill,
                              color: Colors.white,
                              size: 30,
                            ),
                        ],
                      ),
                      title: Text(
                        widget.popularSongs[index]['title']!,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      subtitle: Text(
                        '${widget.popularSongs[index]['plays']} plays',
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                      trailing: Text(
                        widget.popularSongs[index]['duration']!,
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
                      ),
                      onTap: () {
                        if (_currentPlayingIndex == index &&
                            _audioPlayer.playing) {
                          _pauseSong();
                        } else if (_currentPlayingIndex == index &&
                            !_audioPlayer.playing) {
                          _resumeSong();
                        } else {
                          _playSong(index);
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
