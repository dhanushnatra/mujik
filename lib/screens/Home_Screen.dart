import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(
                Icons.settings,
                color: Colors.green,
                size: 35,
              ),
            ),
          ),
        ],
        title: Text('Moozic',
            style: TextStyle(
                color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
