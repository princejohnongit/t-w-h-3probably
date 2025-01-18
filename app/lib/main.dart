import 'package:flutter/material.dart';
import './components/layout/Navbar.dart';
import './components/pages/Login.dart';
import './components/pages/Register.dart';
import './utils/StorageHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = StorageHelper('./data/db.json');
  final data = await storage.readData();

  final bool isLoggedIn = data['loggedInUser'] != null;

  runApp(MyApp(isLoggedIn: isLoggedIn, storage: storage, data: data));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final StorageHelper storage;
  final Map<String, dynamic> data;

  MyApp({required this.isLoggedIn, required this.storage, required this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLoggedIn ? '/' : '/login',
      routes: {
        '/': (context) => Navbar(storage: storage, data: data),
        '/login': (context) => LoginPage(storage: storage),
        '/register': (context) => RegisterPage(storage: storage),
      },
    );
  }
}
