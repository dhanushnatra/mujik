import 'package:flutter/material.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Downloads',
              style: TextStyle(
                color: Colors.green,
                fontFamily: 'Modak',
                fontSize: 35,
              )),
        ),
      ),
      body: Center(
        child: Text('Downloads'),
      ),
    );
  }
}
