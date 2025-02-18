import 'dart:convert';
import 'package:http/http.dart' as http;

Future globalsearch(String query) async {
  query.split(' ').join('+');
  var url = Uri.parse('https://saavn.dev/api/search?query=$query');
  try {
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data["data"];
  } catch (e) {
    // do nothing
  }
}

Future moreAlbums(String query) async {
  query.split(' ').join('+');
  var url = Uri.parse('https://saavn.dev/api/search/albums$query');
  try {
    var response = await http.get(url);

    var data = jsonDecode(response.body);
    return data["data"];
  } catch (e) {
    // do nothing
  }
}

Future moreSongs(String query) async {
  query.split(' ').join('+');
  var url = Uri.parse('https://saavn.dev/api/search/songs?query=$query');
  try {
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data["data"]["results"];
  } catch (e) {
    // do nothing
  }
}

Future morePlaylists(String query) async {
  query.split(' ').join('+');
  var url = Uri.parse('https://saavn.dev/api/search/playlists?query=$query');
  try {
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data["data"];
  } catch (e) {
    // do nothing
  }
}

Future moreArtists(String query) async {
  query.split(' ').join('+');
  var url = Uri.parse('https://saavn.dev/api/search/artists?query=$query');
  try {
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data["data"];
  } catch (e) {
    // do nothing
  }
}
