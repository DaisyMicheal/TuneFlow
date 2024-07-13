import 'package:flutter/material.dart';
import 'artise/aritise_fav.dart';

class Artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best of Artist',
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
                    MaterialPageRoute(builder: (context) => ArtistPage()),
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildArtistItem('Justin Bieber', 'assets/givon.jpg'),
                  _buildArtistItem('Dua Lipa', 'assets/EdSheeran.jpg'),
                  _buildArtistItem('Taylor Swift', 'assets/oliva.jpg'),
                  _buildArtistItem('The Weeknd', 'assets/ayra.jpg'),
                  _buildArtistItem('Justin Bieber', 'assets/givon.jpg'),
                  _buildArtistItem('Dua Lipa', 'assets/EdSheeran.jpg'),
                  _buildArtistItem('Taylor Swift', 'assets/oliva.jpg'),
                  _buildArtistItem('The Weeknd', 'assets/ayra.jpg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtistItem(String artist, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 5),
          Text(
            artist,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
