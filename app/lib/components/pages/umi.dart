import 'package:flutter/material.dart';
import '../pages/bhimumi.dart';

class UMIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UMI Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selected Policies and Progress
            Card(
              elevation: 4,
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Policy: 60-Day Rehab',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Joined: July 2024'),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.75, // 75% progress
                      backgroundColor: Colors.grey[300],
                      color: Colors.green,
                      minHeight: 8,
                    ),
                    SizedBox(height: 8),
                    Text('Progress: 75%'),
                    SizedBox(height: 8),
                    Text('Ending: August 31, 2024'),

                    // Space between sections
                    SizedBox(height: 20),

                    // Upcoming Events Section
                    Text(
                      'Upcoming Events',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Smoking September',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text('Start Date: September 1, 2024'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Health Credit Details
            Expanded(
              child: Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BhimumiPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Health Credit Details',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tap to view detailed rewards and manage credits!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
