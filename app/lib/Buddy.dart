import 'package:flutter/material.dart';

class HelpForMyFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        title: Center(
          child: Text(
            'Help for My Friend',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              title: 'Assessment',
              description: 'Evaluate your friend\'s behavior and situation.',
              icon: Icons.assignment,
              color: Colors.blue.shade700,
              textColor: Colors.white,
              onPressed: () {
                // Navigate to assessment page
              },
            ),
            _buildSection(
              title: 'Suggestions',
              description: 'Get tailored advice based on the assessment.',
              icon: Icons.lightbulb_outline,
              color: Colors.blue.shade500,
              textColor: Colors.white,
              onPressed: () {
                // Navigate to suggestions page
              },
            ),
            _buildSection(
              title: 'For Contact',
              description: 'Reach out to professionals for help.',
              icon: Icons.contact_phone,
              color: Colors.green.shade600,
              textColor: Colors.white,
              onPressed: () {
                // Navigate to contact page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Icon(
                  icon,
                  size: 32,
                  color: textColor,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
