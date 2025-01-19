import 'package:flutter/material.dart';
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Professionals'),
        backgroundColor: Colors.green.shade600,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dr. John Doe'),
            subtitle: const Text('Psychiatrist'),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle appointment booking logic
              },
              child: const Text('Book Appointment'),
            ),
          ),
          ListTile(
            title: const Text('Dr. Jane Smith'),
            subtitle: const Text('Therapist'),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle appointment booking logic
              },
              child: const Text('Book Appointment'),
            ),
          ),
        ],
      ),
    );
  }
}
