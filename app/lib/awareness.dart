import 'package:flutter/material.dart';

class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awareness'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort By',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(
                      value: 'A-Z',
                      child: Text('A-Z'),
                    ),
                    DropdownMenuItem(
                      value: 'Z-A',
                      child: Text('Z-A'),
                    ),
                  ],
                  onChanged: (value) {},
                  hint: const Text('A-Z'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildToggleButton('Type', true),
                _buildToggleButton('Services', false),
              ],
            ),
            const SizedBox(height: 20),
            _buildCard(
              context,
              title: 'Video:',
              icon: Icons.play_circle_fill,
              actionText: 'Make Appointment',
              color: Colors.blue.shade100,
            ),
            const SizedBox(height: 10),
            _buildCard(
              context,
              title: 'Image:',
              icon: Icons.image,
              actionText: 'Make Appointment',
              color: Colors.pink.shade100,
            ),
            const SizedBox(height: 10),
            _buildCard(
              context,
              title: 'Blog',
              icon: Icons.article,
              actionText: '',
              color: Colors.blue.shade50,
              isBlog: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade300 : Colors.blue.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required String actionText,
      required Color color,
      bool isBlog = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(icon, size: 40, color: Colors.black54),
              const Spacer(),
              if (actionText.isNotEmpty)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(actionText),
                ),
            ],
          ),
          if (isBlog)
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Info',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
