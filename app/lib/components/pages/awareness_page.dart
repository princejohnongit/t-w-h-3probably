import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AwarenessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
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
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              SizedBox(height: 16),
              _videoPreviewBox(
                title: 'Sample Video 2',
                link: 'https://www.youtube.com/watch?v=dummy2',
                duration: '10:45',
              ),
              SizedBox(height: 16),
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.grey[300],
            ),
            child: Center(
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Share.share(link),
                      icon: Icon(Icons.share, size: 16),
                      label: Text('Share'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              SizedBox(height: 16),
              _photoPreviewBox(
                title: 'Sample Photo 2',
                link: 'https://dummyimage.com/photo2',
              ),
              SizedBox(height: 16),
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.grey[300],
            ),
            child: Center(
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () => Share.share(link),
                  icon: Icon(Icons.share, size: 16),
                  label: Text('Share'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 2.0,
            )),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              SizedBox(height: 16),
              _blogPreviewBox(
                title: 'Sample Blog 2',
                link: 'https://dummyblog.com/blog2',
              ),
              SizedBox(height: 16),
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => Share.share(link),
              icon: Icon(Icons.share, size: 16),
              label: Text('Share'),
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
