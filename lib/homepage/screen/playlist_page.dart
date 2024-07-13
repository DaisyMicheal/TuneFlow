import 'package:flutter/material.dart';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(227, 167, 166, 165),
              Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.group, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/album5.jpg',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pop Mix',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Public Playlist',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Ruth B., Ava Max, Martin Garrix and more',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      '• 50 songs, 2 hr 49 min',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '• Made for Daisy',
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.play_circle_fill,
                                color: Colors.green, size: 50),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.shuffle,
                                color: Colors.white, size: 30),
                            onPressed: () {},
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.download,
                                color: Colors.white, size: 30),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.more_vert,
                                color: Colors.white, size: 30),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(color: Colors.grey[700]),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: playlistSongs.length,
                      itemBuilder: (context, index) {
                        final song = playlistSongs[index];
                        return ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          leading: Image.asset(
                            song['imagePath']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            song['title']!,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            song['artist']!,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          trailing: Text(
                            song['duration']!,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          onTap: () {
                            // Handle song tap
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> playlistSongs = [
  {
    'title': 'Lost Boy',
    'artist': 'Ruth B.',
    'duration': '4:36',
    'imagePath': 'assets/album16.jpg',
  },
  {
    'title': 'Sweet but Psycho',
    'artist': 'Ava Max',
    'duration': '3:07',
    'imagePath': 'assets/album16.jpg',
  },
  {
    'title': 'Scared to Be Lonely',
    'artist': 'Martin Garrix, Dua Lipa',
    'duration': '3:41',
    'imagePath': 'assets/album16.jpg',
  },
  // Add more songs as needed
];
