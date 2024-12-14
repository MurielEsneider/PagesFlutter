import 'package:flutter/material.dart';
import 'package:youtube_web/screen/entretenimiento.dart';
import 'package:youtube_web/screen/deportes.dart';
import 'package:youtube_web/screen/tecnologia.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú de Navegación',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_soccer),
              title: Text('Deportes'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Deportes()));
              },
            ),
            ListTile(
              leading: Icon(Icons.computer),
              title: Text('Tecnología'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tecnologia()));
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Entretenimiento'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Entretenimiento()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Contenido principal',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
