import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> chatMessages = [];

  final String apiKey = 'AIzaSyABDkYOA9yQoQ39miQU5FimerMITrMwmQM';

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      chatMessages.add({'sender': 'user', 'message': userMessage});
    });

    final url = Uri.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey");
    
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'contents': [
        {'parts': [{'text': userMessage}]}
      ]
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        String aiResponse = data['contents'][0]['parts'][0]['text'];
        
        setState(() {
          chatMessages.add({'sender': 'ai', 'message': aiResponse});
        });
      } else {
        setState(() {
          chatMessages.add({'sender': 'ai', 'message': 'Error: Unable to get response from AI.'});
        });
      }
    } catch (e) {
      setState(() {
        chatMessages.add({'sender': 'ai', 'message': 'Error: $e'});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                return ListTile(
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(
                          color: message['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1, color: Colors.black),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final userMessage = _controller.text;
                    if (userMessage.isNotEmpty) {
                      sendMessage(userMessage);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
