import 'package:flutter/material.dart';
import 'package:moozic/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List result = [];
  void getresults(String value) {
    moreArtists(value).then((value) {
      setState(() {
        result = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Image(
              image: AssetImage('assets/logo.png'),
              height: 20,
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(136, 211, 205, 70),
                borderRadius: BorderRadius.circular(50.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                onSubmitted: getresults,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return MusicCard(
                    title: result[index]['name'],
                    imageUrl: result[index]['image'][1]["url"],
                  );
                },
              ),
            ),
          ]),
    );
  }
}

class MusicCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const MusicCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {print('tapped $title')},
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image.network(imageUrl),
              title: Text(title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 10),
                  Icon(Icons.file_download_outlined),
                ],
              ),
            )));
  }
}
