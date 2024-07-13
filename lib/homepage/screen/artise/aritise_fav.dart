import 'package:flutter/material.dart';
import ' artist_detail.dart';
import 'HoverableArtistCard.dart';
import 'data.dart';

class ArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Your favorite artists',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: favoriteArtists.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtistDetailPage(
                            artistName: favoriteArtists[index]['name']!,
                            artistImagePath: favoriteArtists[index]['imagePath']!,
                            monthlyListeners: favoriteArtists[index]['monthlyListeners']!,
                            popularSongs: favoriteArtists[index]['popularSongs']!,
                          ),
                        ),
                      );
                    },
                    child: HoverableArtistCard(
                      imagePath: favoriteArtists[index]['imagePath']!,
                      name: favoriteArtists[index]['name']!,
                      profession: 'Artist', // Example profession
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
