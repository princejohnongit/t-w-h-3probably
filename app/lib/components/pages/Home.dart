import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:io';

import 'awareness_page.dart'; // Import AwarenessPage here

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "User";

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  Future<void> loadUserName() async {
    try {
      // Provide the path to your db.json file
      final file = File('lib/data/db.json'); // Adjust the path as needed
      if (await file.exists()) {
        final String response = await file.readAsString();

        // Parse JSON and extract the user's name
        final data = json.decode(response) as Map<String, dynamic>;
        setState(() {
          userName = data['user']?['name'] ?? "User";
        });
      } else {
        throw Exception('File not found');
      }
    } catch (e) {
      // Handle errors, such as file not found
      debugPrint('Error reading db.json: $e');
      setState(() {
        userName = "User"; // Fallback value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $userName'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButton(
              title: 'Control',
              onTap: () => navigateTo(context, 'Control Page'),
            ),
            SizedBox(height: 20),
            HomeButton(
              title: 'Assessment',
              onTap: () => navigateTo(context, 'Assessment Page'),
            ),
            SizedBox(height: 20),
            HomeButton(
              title: 'Community',
              onTap: () => navigateTo(context, 'Community Page'),
            ),
            SizedBox(height: 20),
            HomeButton(
              title: 'Consultation',
              onTap: () => navigateTo(context, 'Consultation Page'),
            ),
            SizedBox(height: 20),
            HomeButton(
              title: 'Awareness', // New button for Awareness
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AwarenessPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, String pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(pageName)),
          body: Center(
            child: Text(
              pageName,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HomeButton({required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 60),
        textStyle: TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(title),
    );
  }
}
