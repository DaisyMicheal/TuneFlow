import 'package:flutter/material.dart';
import 'playlist_page.dart';

class MusicRecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Your Top Mix',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75, // Adjusted aspect ratio for image and text
          ),
          itemCount: recommendedStations.length,
          itemBuilder: (context, index) {
            return HoverableImageCard(
              imagePath: recommendedStations[index]['imagePath']!,
              title: recommendedStations[index]['title']!,
              artist: recommendedStations[index]['artist']!,
            );
          },
        ),
      ),
    );
  }
}

class HoverableImageCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String artist;

  HoverableImageCard({
    required this.imagePath,
    required this.title,
    required this.artist,
  });

  @override
  _HoverableImageCardState createState() => _HoverableImageCardState();
}

class _HoverableImageCardState extends State<HoverableImageCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistPage()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (_) => setState(() => _isHovering = true),
            onExit: (_) => setState(() => _isHovering = false),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    height: 190, // Fixed height for the images
                    width: double.infinity,
                  ),
                ),
                if (_isHovering)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black45,
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // Ensures text does not wrap
          ),
          SizedBox(height: 4),
          Text(
            widget.artist,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // Ensures text does not wrap
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> recommendedStations = [
  {
    'title': 'Ed Sheeran Mix',
    'artist': 'Julia Michaels, Ruth B. and Clean Bandit',
    'imagePath': 'assets/mix6.jpg'
  },
  {
    'title': 'Ed Sheeran Mix',
    'artist': 'Julia Michaels, Ruth B. and Clean Bandit',
    'imagePath': 'assets/mix2.jpg'
  },
  {
    'title': 'Annatoria Mix',
    'artist': 'Grace Lokwa, Moses Bliss and Victor...',
    'imagePath': 'assets/mix5.jpg'
  },
  {
    'title': 'Upbeat Mix',
    'artist': 'Selena Gomez, Alan Walker, Clean Bandit...',
    'imagePath': 'assets/mix4.jpg'
  },
];
