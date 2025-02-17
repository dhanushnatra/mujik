import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moozic/models/Song.dart';

Future<Songs> fetchSongs(String text) async {
  final response = await http.get(Uri.parse(
      'https://saavn.dev/api/search/songs?query=${text.split(' ').join('+')}'));

  if (response.statusCode == 200) {
    return Songs.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load songs');
  }
}
