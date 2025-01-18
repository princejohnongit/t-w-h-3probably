import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings icon press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(title: 'Awareness'),
            SizedBox(height: 16.0),
            Section(title: 'Prevention'),
            SizedBox(height: 16.0),
            Section(title: 'Consultation'),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;

  Section({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}