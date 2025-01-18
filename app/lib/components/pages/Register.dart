import 'package:flutter/material.dart';
import '../../utils/StorageHelper.dart';
import 'dart:math';

class RegisterPage extends StatelessWidget {
  final StorageHelper storage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key, required this.storage});

  String generateUMICode() {
    final random = Random();
    return 'UMI${random.nextInt(90000) + 10000}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final data = await storage.readData();
                final users = data['users'] as List<dynamic>;

                final newUser = {
                  'id': users.length + 1,
                  'name': nameController.text,
                  'email': emailController.text,
                  'password': passwordController.text,
                  'umi_code': generateUMICode(),
                  'user_type': 'new_user',
                  'medical_history': [],
                };

                users.add(newUser);
                data['users'] = users;
                data['loggedInUser'] = newUser;

                await storage.writeData(data);
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
