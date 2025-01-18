import 'package:flutter/material.dart';
import '../../utils/StorageHelper.dart';

class LoginPage extends StatelessWidget {
  final StorageHelper storage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                for (var user in users) {
                    print(user);
                  // if (user['email'] == emailController.text) {
                  // }
                }
                final user = users.firstWhere(
                  (user) =>
                      user['email'] == emailController.text &&
                      user['password'] == passwordController.text,
                  orElse: () => null,
                );

                if (user != null) {
                  data['loggedInUser'] = user;
                  await storage.writeData(data);
                  Navigator.pushReplacementNamed(context, '/');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
