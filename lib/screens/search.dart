import 'package:flutter/material.dart';
import 'package:saavnapi/saavnapi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool submit = false;
  void onsubmit() {
    setState(() {
      submit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            fontFamily: "Modak",
            fontSize: 30,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildSearchBar(),
          submit ? songresults(_controller.text) : Container(),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        onSubmitted: (value) => onsubmit(),
        decoration: InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.green.shade900,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget songresults(query) {
    return FutureBuilder<Songs>(
      future: SaavnApi().songs.fetchSongs(query, n: "20"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error occurred'));
        } else if (!snapshot.hasData || snapshot.data!.songs.isEmpty) {
          return const Center(child: Text('No results found'));
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.songs.length,
              itemBuilder:
                  (context, index) => songtile(snapshot.data!.songs[index]),
            ),
          );
        }
      },
    );
  }

  Widget songtile(Song song) {
    return ListTile(
      leading: ClipRRect(child: Image.network(song.imageUrl)),
      title: Text(song.title, style: TextStyle(color: Colors.green)),
      subtitle: Text(song.artist),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              print("pressed fav for ${song.title}");
            },
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              print("download ${song.url}");
            },
            icon: Icon(Icons.download),
          ),
          IconButton(
            onPressed: () {
              print("pressed more verti for ${song.title}");
            },
            icon: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
    );
  }
}
