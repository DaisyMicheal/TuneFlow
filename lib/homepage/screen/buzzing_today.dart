import 'package:flutter/material.dart';
import 'music_recommendations_page.dart';

class BuzzingToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Buzzing Today',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicRecommendationsPage(),
                  ),
                );
              },
              child: Text(
                'See all',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildBuzzingItem(
                  'Feeling Down', 'By Vaines', 'assets/album1.jpg'),
              _buildBuzzingItem(
                  'Belong With Me', 'By Taylor Swift', 'assets/album2.jpg'),
              _buildBuzzingItem(
                  'Happier Than Ever', 'By Billie Eilish', 'assets/album3.jpg'),
              _buildBuzzingItem(
                  'Feeling Down', 'By Vaines', 'assets/album4.jpg'),
              _buildBuzzingItem(
                  'Belong With Me', 'By Taylor Swift', 'assets/album5.jpg'),
              _buildBuzzingItem(
                  'Happier Than Ever', 'By Billie Eilish', 'assets/album6.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBuzzingItem(String title, String artist, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imagePath,
                width: 120, height: 120, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Icon(
              Icons.play_circle_fill,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
