import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'photos_page.dart';
import 'videos_page.dart';
import 'blog_details.dart'; // Add a page to show detailed blog content

class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awareness'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Explore Awareness'),
            _awarenessCard(
              context,
              'Videos',
              Icons.play_circle_fill,
              Colors.blue,
              const VideosPage(),
            ),
            _awarenessCard(
              context,
              'Photos',
              Icons.image,
              Colors.green,
              const PhotosPage(),
            ),
            const SizedBox(height: 20),
            _sectionTitle('Read Blogs'),
            _blogCard(
              context,
              'Preventing Drug Misuse',
              'Learn the steps to avoid drug misuse and promote a healthy lifestyle.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _awarenessCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, size: 30, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _blogCard(BuildContext context, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.orange.withOpacity(0.2),
          child: const Icon(Icons.article, size: 30, color: Colors.orange),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BlogDetailsPage(
              title: 'Preventing Drug Misuse',
              content: """
Drug misuse can have severe physical, mental, and emotional consequences. 
1. Educate yourself and others about the dangers of substance abuse. 
2. Build strong family and community connections.
3. Practice stress management through healthy habits like exercise or meditation.
4. Seek help early if you notice signs of addiction.

Together, we can create a drug-free society.
""",
            ),
          ),
        ),
      ),
    );
  }
}
