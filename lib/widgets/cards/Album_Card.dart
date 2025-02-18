import 'package:flutter/material.dart';
import 'package:moozic/models/Album.dart';

class AlbumCard extends StatefulWidget {
  final Album album;
  const AlbumCard({super.key, required this.album});

  @override
  State<AlbumCard> createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      borderOnForeground: true,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(widget.album.imageUrl, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          widget.album.title.replaceAll('&quot;', ''),
          style: TextStyle(color: Colors.green[200]),
        ),
        onTap: () {
          print('Playing ${widget.album.title}');
        },
      ),
    );
  }
}
