import 'package:flutter/material.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums',
            style: TextStyle(
                color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
      ),
      body: Center(
        child: Text('Albums'),
      ),
    );
  }
}
