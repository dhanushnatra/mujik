import 'package:flutter/material.dart';
import 'package:moozic/api/saavn.dart';
import 'package:moozic/widgets/Cards.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  _SearchScreenState() {
    searchController.addListener(() async {
      if (searchController.text.length > 0) {
        await fetchSongs(searchController.text);
        setState(() {
          isSearching = true;
        });
      } else {
        setState(() {
          isSearching = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Search',
              style: TextStyle(
                  color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
        ),
      ),
      body: Column(
        children: [
          _searchView(),
          Expanded(child: isSearching ? _showresults() : Container())
        ],
      ),
    );
  }

  Widget _searchView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 72, 104, 73),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }

  Widget _showresults() {
    return FutureBuilder(
      future: fetchSongs(searchController.text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.songs.length,
            itemBuilder: (context, index) {
              return MusicCard(song: snapshot.data!.songs[index]);
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Searching();
      },
    );
  }

  Widget Searching() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
