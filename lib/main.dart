import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moozic/screens/Downloads_Screen.dart';
import 'package:moozic/screens/Home_Screen.dart';
import 'package:moozic/screens/Settings_Screen.dart';
import 'package:moozic/screens/Search_screen.dart';
import 'package:moozic/screens/Music_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const DownloadsScreen(),
  ];
  ontapindex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<bool> get isDarkMode async {
    await Hive.openBox('settings');
    return Hive.box('settings').get('darkMode', defaultValue: false);
  }

  @override
  Widget build(BuildContext context) {
    print(isDarkMode);
    return MaterialApp(
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/music': (context) => const MusicScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GNav(
                tabBorder: Border(
                  top: BorderSide(color: Colors.green, width: 2),
                ),
                tabActiveBorder: Border(
                    top: BorderSide(
                  color: Colors.green,
                  width: 2,
                )),
                tabBackgroundColor: Colors.green.withOpacity(0.2),
                gap: 10,
                onTabChange: ontapindex,
                tabs: [
                  GButton(
                    icon: FontAwesomeIcons.home,
                    iconActiveColor: Colors.green,
                    text: 'home',
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  GButton(
                    icon: FontAwesomeIcons.search,
                    text: 'search',
                    iconActiveColor: Colors.green,
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  GButton(
                    icon: FontAwesomeIcons.download,
                    text: 'downloads',
                    iconActiveColor: Colors.green,
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ],
                selectedIndex: selectedIndex,
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
    );
  }
}
