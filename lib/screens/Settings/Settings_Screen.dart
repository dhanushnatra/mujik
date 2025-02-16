import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _isEndlessPlayback = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    var box = await Hive.openBox('settings');
    setState(() {
      _isDarkMode = box.get('darkMode', defaultValue: false);
      _isEndlessPlayback = box.get('endlessPlayback', defaultValue: false);
    });
  }

  void _toggleDarkMode(bool value) async {
    var box = await Hive.openBox('settings');
    setState(() {
      _isDarkMode = value;
      box.put('darkMode', value);
    });
  }

  void _toggleEndlessPlayback(bool value) async {
    var box = await Hive.openBox('settings');
    setState(() {
      _isEndlessPlayback = value;
      box.put('endlessPlayback', value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Settings',
              style: TextStyle(
                  color: Colors.green, fontFamily: 'Modak', fontSize: 35)),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("DarkMode"),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: _toggleDarkMode,
            ),
          ),
          ListTile(
            title: Text("Endless playback"),
            trailing: Switch(
                value: _isEndlessPlayback, onChanged: _toggleEndlessPlayback),
          )
        ],
      ),
    );
  }
}
