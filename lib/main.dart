import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(TogetherWeHealApp());
}

class TogetherWeHealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TogetherWeHeal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _showAnonymousReportingForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnonymousReportingForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TogetherWeHeal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Welcome to TogetherWeHeal',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'TogetherWeHeal is a comprehensive, AI-driven platform designed to address the multifaceted challenges of addiction and substance abuse. Our mission is to provide a supportive and secure environment for individuals to heal, grow, and thrive.',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showAnonymousReportingForm(context),
                child: Text('Anonymous Reporting'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              Image.asset(
                'assets/healing_image.png', // Replace with your image path
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Together, we can heal and build a better future.',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.teal),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnonymousReportingForm extends StatefulWidget {
  @override
  _AnonymousReportingFormState createState() => _AnonymousReportingFormState();
}

class _AnonymousReportingFormState extends State<AnonymousReportingForm> {
  final _formKey = GlobalKey<FormState>();
  String _report = '';

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/anonymous_data.json';
  }

  Future<void> _saveData(String report) async {
    final filePath = await _getFilePath();
    final file = File(filePath);

    List<dynamic> data = [];
    if (await file.exists()) {
      final content = await file.readAsString();
      data = json.decode(content);
    }

    data.add({'report': report, 'timestamp': DateTime.now().toString()});

    await file.writeAsString(json.encode(data));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Anonymous Reporting'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Describe your concern',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a report';
            }
            return null;
          },
          onSaved: (value) => _report = value!,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              await _saveData(_report);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Report submitted anonymously')),
              );
              Navigator.of(context).pop();
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
