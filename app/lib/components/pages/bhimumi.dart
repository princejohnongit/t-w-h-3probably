import 'package:flutter/material.dart';

class BhimumiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter UMI PIN'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Your UMI PIN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UMI PIN',
                  hintText: 'Enter 4-digit PIN',
                  prefixIcon: Icon(Icons.lock),
                ),
                maxLength: 4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to rewards and balance page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RewardsAndBalancePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RewardsAndBalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards and Balance'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Account Balance',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\₹1,500.00',
              style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              'Rewards Waiting for You',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.fitness_center, color: Colors.blue),
                title: Text('Gym Membership'),
                subtitle: Text('Enjoy a free gym membership for 1 year.'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.local_pharmacy, color: Colors.green),
                title: Text('50% Off on Pharmacy'),
                subtitle: Text('Get 50% discount on all pharmacy purchases.'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.health_and_safety, color: Colors.red),
                title: Text('Free Health Consultation'),
                subtitle: Text('Book a free consultation with top doctors.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
