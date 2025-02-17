import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music',
            style: TextStyle(
                color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
      ),
      body: Center(
        child: Text('Music'),
      ),
    );
  }
}
