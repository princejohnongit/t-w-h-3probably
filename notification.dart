import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'News',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue.shade100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Today', 'Mark all'),
          _buildNotificationItem(
              title: 'Scheduled Appointment', time: '2 M', isHighlighted: true),
          _buildNotificationItem(
              title: 'Scheduled Change', time: '2 H', isHighlighted: false),
          _buildNotificationItem(
              title: 'Medical Notes', time: '3 H', isHighlighted: false),
          SizedBox(height: 16),
          _buildSectionTitle('Yesterday', ''),
          _buildNotificationItem(
              title: 'Scheduled Appointment', time: '1 D', isHighlighted: false),
          SizedBox(height: 16),
          _buildSectionTitle('15 April', ''),
          _buildNotificationItem(
              title: 'Medical History Update', time: '5 D', isHighlighted: false),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (actionText.isNotEmpty)
          TextButton(
            onPressed: () {},
            child: Text(
              actionText,
              style: TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }

  Widget _buildNotificationItem(
      {required String title, required String time, bool isHighlighted = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.blue.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Details'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade300,
                  onPrimary: Colors.white,
                  minimumSize: Size(80, 30),
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
