import 'package:flutter/material.dart';

class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Awareness',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoSubPage()),
                  );
                },
                child: _sectionCard(
                  title: 'Videos',
                  icon: Icons.play_circle_fill,
                  color: Colors.indigoAccent,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoSubPage()),
                  );
                },
                child: _sectionCard(
                  title: 'Photos',
                  icon: Icons.image,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlogSubPage()),
                  );
                },
                child: _sectionCard(
                  title: 'Blogs',
                  icon: Icons.article,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required IconData icon, required Color color}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon,
                size: 64,
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Welcome to the Awareness Page!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'This page is designed to provide resources, tips, and information to improve your awareness.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            AwarenessButton(
              title: 'Learn More',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Learn More'),
                      content: Text(
                        'This is a placeholder for detailed awareness information. Replace this with your content.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            AwarenessButton(
              title: 'Go Back',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VideoSubPage extends StatelessWidget {
  const VideoSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _videoPreviewBox(
                title: 'Sample Video 1',
                link: 'https://www.youtube.com/watch?v=dummy1',
                duration: '5:12',
              ),
              const SizedBox(height: 16),
              _videoPreviewBox(
                title: 'Sample Video 2',
                link: 'https://www.youtube.com/watch?v=dummy2',
                duration: '10:45',
              ),
              const SizedBox(height: 16),
              _videoPreviewBox(
                title: 'Sample Video 3',
                link: 'https://www.youtube.com/watch?v=dummy3',
                duration: '3:30',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _videoPreviewBox({
    required String title,
    required String link,
    required String duration,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.grey[300],
            ),
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 64,
                color: Colors.indigoAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Share.share(link),
                      icon: const Icon(Icons.share, size: 16),
                      label: const Text('Share'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoSubPage extends StatelessWidget {
  const PhotoSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _photoPreviewBox(
                title: 'Sample Photo 1',
                link: 'https://dummyimage.com/photo1',
              ),
              const SizedBox(height: 16),
              _photoPreviewBox(
                title: 'Sample Photo 2',
                link: 'https://dummyimage.com/photo2',
              ),
              const SizedBox(height: 16),
              _photoPreviewBox(
                title: 'Sample Photo 3',
                link: 'https://dummyimage.com/photo3',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _photoPreviewBox({
    required String title,
    required String link,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.grey[300],
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 64,
                color: Colors.teal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () => Share.share(link),
                  icon: const Icon(Icons.share, size: 16),
                  label: const Text('Share'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlogSubPage extends StatelessWidget {
  const BlogSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _blogPreviewBox(
                title: 'Sample Blog 1',
                link: 'https://dummyblog.com/blog1',
              ),
              const SizedBox(height: 16),
              _blogPreviewBox(
                title: 'Sample Blog 2',
                link: 'https://dummyblog.com/blog2',
              ),
              const SizedBox(height: 16),
              _blogPreviewBox(
                title: 'Sample Blog 3',
                link: 'https://dummyblog.com/blog3',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blogPreviewBox({
    required String title,
    required String link,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => Share.share(link),
              icon: const Icon(Icons.share, size: 16),
              label: const Text('Share'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
