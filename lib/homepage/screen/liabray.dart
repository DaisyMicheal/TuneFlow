import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'music_home_page.dart';

class MusicLibraryPage extends StatefulWidget {
  @override
  _MusicLibraryPageState createState() => _MusicLibraryPageState();
}

class _MusicLibraryPageState extends State<MusicLibraryPage> {
  List<Map<String, String>> allSongs = [
    {
      'title': 'DOGTOOTH',
      'artist': 'Tyler, The Creator',
      'imagePath': 'assets/taylor.jpg',
      'url': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Fall Apart',
      'artist': 'Death in June',
      'imagePath': 'assets/taylor.jpg',
      'url': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
    {
      'title': 'Wonder',
      'artist': 'Kanye West',
      'imagePath': 'assets/taylor.jpg',
      'url': 'http://webaudioapi.com/samples/audio-tag/chrono.mp3'
    },
  ];

  late List<Map<String, String>> filteredSongs;
  String searchQuery = '';
  AudioPlayer audioPlayer = AudioPlayer();
  int? currentSongIndex;

  @override
  void initState() {
    super.initState();
    filteredSongs = allSongs;
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        playNextSong();
      }
      setState(() {}); // To update the UI based on player state
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredSongs = allSongs.where((song) {
        return song['title']!.toLowerCase().contains(query.toLowerCase()) ||
            song['artist']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void onPlayAll() {
    if (filteredSongs.isNotEmpty) {
      currentSongIndex = 0;
      playSong(currentSongIndex!);
    }
  }

  void playSong(int index) async {
    try {
      final songUrl = filteredSongs[index]['url']!;
      print('Playing song: $songUrl');
      await audioPlayer.setUrl(songUrl);
      audioPlayer.play();
      setState(() {
        currentSongIndex = index;
      });
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  void pauseSong() {
    audioPlayer.pause();
  }

  void playNextSong() {
    if (currentSongIndex != null && currentSongIndex! < filteredSongs.length - 1) {
      currentSongIndex = currentSongIndex! + 1;
      playSong(currentSongIndex!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MusicHomePage()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/album6.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'My list',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/taylor.jpg'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Jhon',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.public, color: Colors.white, size: 16),
                        Spacer(),
                        Text(
                          '12h 40min',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: 'Find in playlist',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: updateSearchQuery,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.grid_view, color: Colors.white),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.list, color: Colors.white),
                          onPressed: () {},
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.sort, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: filteredSongs.isEmpty
                    ? Center(
                  child: Text(
                    'Song not found',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
                    : ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: filteredSongs.length,
                  itemBuilder: (context, index) {
                    final song = filteredSongs[index];
                    bool isPlaying = index == currentSongIndex && audioPlayer.playing;
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          song['imagePath']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(song['title']!, style: TextStyle(color: Colors.white)),
                      subtitle: Text(song['artist']!, style: TextStyle(color: Colors.white)),
                      trailing: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          if (isPlaying) {
                            pauseSong();
                          } else {
                            playSong(index);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
