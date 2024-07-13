import 'package:flutter/material.dart';

class HoverableArtistCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String profession;

  HoverableArtistCard({
    required this.imagePath,
    required this.name,
    required this.profession,
  });

  @override
  _HoverableArtistCardState createState() => _HoverableArtistCardState();
}

class _HoverableArtistCardState extends State<HoverableArtistCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Ensure the Column takes minimal vertical space
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  widget.imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              if (_isHovering)
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          widget.profession,
          style: TextStyle(
            color: Colors.grey[400],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
