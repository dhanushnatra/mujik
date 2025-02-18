import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key, required this.title});
  final String title;
  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_sharp),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.vertical_align_bottom),
            onPressed: () {
              print('vertical pressed ');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Music'),
      ),
    );
  }
}
