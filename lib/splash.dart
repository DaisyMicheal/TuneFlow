import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage/screen/music_home_page.dart';

// _buildRecentTuneItem('Cruel Summer', 'Taylor Swift', '3:00', 'assets/taylor.jpg'),
// _buildRecentTuneItem('Paint Town Red', 'Doja Cat', '2:00', 'assets/ella.jpg'),
// _buildRecentTuneItem('Into The Walls', 'By Artist', '4:00', 'assets/tyla.jpg'),
// _buildRecentTuneItem('Cruel Summer', 'Taylor Swift', '3:00', 'assets/taylor.jpg'),
// _buildRecentTuneItem('Paint Town Red', 'Doja Cat', '2:00', 'assets/zendaya.jpg'),
// _buildRecentTuneItem('Into The Walls', 'By Artist', '4:00', 'assets/shawn.jpg'),
// _buildRecentTuneItem('Cruel Summer', 'Taylor Swift', '3:00', 'assets/oliva.jpg'),
// _buildRecentTuneItem('Paint Town Red', 'Doja Cat', '2:00', 'assets/john.jpg'),
// _buildRecentTuneItem('Into The Walls', 'By Artist', '4:00', 'assets/kendrick.jpg'),


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.3)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enjoy hear the best\nmusic with us',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'What do you want to hear, enjoy hear the\nbest music with us',
                  style: GoogleFonts.roboto(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MusicHomePage ()),
                      );
                    },
                    child: Text(
                      'Get started',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}