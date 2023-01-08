import 'package:chatrooms/chathome.dart';
import 'package:chatrooms/username.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String username = "";
  checkuser() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username')!;
  }

  @override
  void initState() {
    super.initState();
    checkuser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chatrooms',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: username!.isEmpty ? UserName() : MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChatHome();
  }
}
