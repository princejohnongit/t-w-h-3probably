import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> photos = [
      'assets/images/photo1.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Card(
            child: Image.asset(
              photos[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
