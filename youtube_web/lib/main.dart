import 'package:flutter/material.dart';
import 'package:youtube_web/screen/videos.dart';
import 'package:youtube_web/screen/sub.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Menu',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const YouTubeHomePage(),
    );
  }
}

class YouTubeHomePage extends StatefulWidget {
  const YouTubeHomePage({super.key});

  @override
  _YouTubeHomePageState createState() => _YouTubeHomePageState();
}

class _YouTubeHomePageState extends State<YouTubeHomePage> {
  Widget _selectedScreen = const Center(child: Text('Bienvenido a YouTube'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube'),
        backgroundColor: Colors.red,
      ),
      drawer: YouTubeMenu(
        onMenuSelected: (Widget screen) {
          setState(() {
            _selectedScreen = screen;
          });
          Navigator.pop(context);
        },
      ),
      body: _selectedScreen,
    );
  }
}

class YouTubeMenu extends StatelessWidget {
  final Function(Widget) onMenuSelected;

  const YouTubeMenu({super.key, required this.onMenuSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.account_circle, size: 50, color: Colors.red),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Usuario',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        'usuario@ejemplo.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.red),
            title: const Text('Inicio'),
            onTap: () {
              onMenuSelected(const Center(child: Text('Bienvenido a YouTube')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up, color: Colors.red),
            title: const Text('Subir video'),
            onTap: () {
              onMenuSelected(const VideoPlatformApp());
            },
          ),
          ListTile(
            leading: const Icon(Icons.subscriptions, color: Colors.red),
            title: const Text('Suscriptores'),
            onTap: () {
              onMenuSelected(const Sub());
            },
          ),
        ],
      ),
    );
  }
}
