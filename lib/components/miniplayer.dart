import 'package:flutter/material.dart';

class Miniplayer extends StatelessWidget {
  final Map<String, dynamic> song;
  const Miniplayer({super.key, required this.song});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(song["image"]),
        ),
        title: Text(song["name"]),
        subtitle: Text(song["artist"]),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.skip_previous),
            SizedBox(width: 10),
            Icon(Icons.play_arrow),
            SizedBox(width: 10),
            Icon(Icons.skip_next),
          ],
        ),
      ),
    );
  }
}
