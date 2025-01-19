import 'package:flutter/material.dart';
class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  // Store the selected answers for each question
  List<String?> answers = List.generate(5, (_) => null);

  // Function to calculate risk score
  int calculateRiskScore() {
    return answers.where((answer) => answer == 'Yes').length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Test'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView(
        children: [
          _buildQuestion(
            question: 'Have you been feeling emotionally unstable or overwhelmed lately?',
            options: ['Yes', 'No'],
            index: 0,
          ),
          _buildQuestion(
            question: 'Are you often surrounded by toxic or negative influences?',
            options: ['Yes', 'No'],
            index: 1,
          ),
          _buildQuestion(
            question: 'Do you often rely on unhealthy coping mechanisms (e.g., avoidance, substance use)?',
            options: ['Yes', 'No'],
            index: 2,
          ),
          _buildQuestion(
            question: 'Do you struggle with staying motivated or consistent in your efforts to improve your situation?',
            options: ['Yes', 'No'],
            index: 3,
          ),
          _buildQuestion(
            question: 'Do you often avoid reflecting on your emotions, behaviors, or triggers?',
            options: ['Yes', 'No'],
            index: 4,
          ),
          ElevatedButton(
            onPressed: () {
              int score = calculateRiskScore();
              String riskLevel = '';
              String suggestions = '';

              if (score >= 4) {
                riskLevel = 'High Risk';
                suggestions = 'You should see a doctor immediately!';
              } else if (score == 2 || score == 3) {
                riskLevel = 'Moderate Risk';
                suggestions = 'It is recommended to consult a doctor for further evaluation.';
              } else {
                riskLevel = 'Low Risk';
                suggestions = 'Your friend seems to be in a good state. Encourage preventive habits.';
              }

              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(riskLevel),
                  content: Text(suggestions),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Submit Assessment'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion({
    required String question,
    required List<String> options,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: answers[index],
              onChanged: (value) {
                setState(() {
                  answers[index] = value;
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
