import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'photos_page.dart';
import 'videos_page.dart';

class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awareness'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _awarenessCard(context, 'Videos', Icons.play_circle_fill, Colors.blue, const VideosPage()),
          _awarenessCard(context, 'Photos', Icons.image, Colors.green, const PhotosPage()),
        ],
      ),
    );
  }

  Widget _awarenessCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(icon, size: 40, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}
