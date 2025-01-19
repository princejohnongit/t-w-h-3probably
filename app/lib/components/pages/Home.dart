import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:io';
import './awareness_page.dart';
import './help_my_friend.dart';
import './consultation.dart';
import './control.dart';
import './community.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String userName = "User";
  String userId = "ID: N/A";
  String profilePicUrl = "";
  String assessmentScore = "Not Assessed";
  String assessmentDate = "No assessment taken";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      final file = File('lib/data/db.json');
      if (await file.exists()) {
        final String response = await file.readAsString();
        final data = json.decode(response) as Map<String, dynamic>;
        setState(() {
          userName = data['user']?['name'] ?? "User";
          userId = "ID: ${data['user']?['id'] ?? 'N/A'}";
          profilePicUrl = data['user']?['profilePic'] ?? "";
          assessmentScore = data['user']?['lastAssessment']?['score']?.toString() ?? "Not Assessed";
          assessmentDate = data['user']?['lastAssessment']?['date'] ?? "No assessment taken";
        });
      } else {
        throw Exception('File not found');
      }
    } catch (e) {
      debugPrint('Error reading db.json: $e');
      setState(() {
        userName = "User";
        userId = "ID: N/A";
        profilePicUrl = "";
        assessmentScore = "Not Assessed";
        assessmentDate = "No assessment taken";
      });
    }
  }

  Widget buildProfileSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[300],
            backgroundImage: profilePicUrl.isNotEmpty
                ? NetworkImage(profilePicUrl) as ImageProvider
                : AssetImage('assets/default_profile.png'),
            child: profilePicUrl.isEmpty && !File('assets/default_profile.png').existsSync()
                ? Icon(Icons.person, size: 40, color: Colors.grey[600])
                : null,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  userId,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 20),
            child: HomeButton(
              title: 'Assessment',
              onTap: () => navigateTo(context, HelpForMyFriendPage()),
              score: assessmentScore,
              date: assessmentDate,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.2,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeButton(
                title: 'Control',
                onTap: () => navigateTo(context, ControlPage()),
              ),
              HomeButton(
                title: 'Community',
                onTap: () => navigateTo(context, CommunityPage()),
              ),
              HomeButton(
                title: 'Consultation',
                onTap: () => navigateTo(context, ConsultationPage()),
              ),
              HomeButton(
                title: 'Awareness',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AwarenessPage()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $userName'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildProfileSection(),
          Divider(thickness: 1),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: buildButtonGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? score;
  final String? date;

  const HomeButton({
    required this.title,
    required this.onTap,
    this.score,
    this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (score != null) ...[
            SizedBox(height: 8),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
          if (date != null) ...[
            SizedBox(height: 4),
            Text(
              'Last: $date',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ],
      ),
    );
  }
}
