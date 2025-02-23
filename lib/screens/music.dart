import 'package:flutter/material.dart';
import 'package:saavnapi/saavnapi.dart';

class MusicScreen extends StatefulWidget {
  final Song song;
  const MusicScreen({super.key, required this.song});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Music",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(child: Text("Music")),
    );
  }
}
