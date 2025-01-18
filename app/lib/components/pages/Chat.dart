import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[50],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'AI Chat',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        // Add AI chat messages here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: Colors.black),
          Expanded(
            child: Container(
              color: Colors.green[50],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Professional Support',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        // Add professional support chat messages here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}