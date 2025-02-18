import 'package:flutter/material.dart';
import 'package:moozic/models/Song.dart';

class MusicCard extends StatelessWidget {
  final Song song;
  const MusicCard({super.key, required this.song});

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
            child: Image.network(song.imageUrl, fit: BoxFit.cover),
          ),
        ),
        title: Text(
          song.title.replaceAll('&quot;', ''),
          style: TextStyle(color: Colors.green[200]),
        ),
        subtitle: Text(song.artist),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.favorite_border_rounded),
              onPressed: () {
                print('Playing ${song.title}');
              },
            ),
            IconButton(
              icon: Icon(Icons.download_rounded),
              onPressed: () {
                print('Added ${song.title} to downloads');
              },
            ),
            IconButton(
                onPressed: () {
                  print('Pressed more vert of ${song.title}');
                },
                icon: Icon(Icons.more_vert_rounded))
          ],
        ),
        onTap: () {
          print('Playing ${song.title}');
        },
      ),
    );
  }
}
