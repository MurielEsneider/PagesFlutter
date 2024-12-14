import 'package:flutter/material.dart';

class Deportes extends StatefulWidget {
  const Deportes({super.key});

  @override
  State<Deportes> createState() => DeportesState();
}

class DeportesState extends State<Deportes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deportes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sección: Deportes',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.sports, size: 40),
              SizedBox(width: 8),
              Text(
                'Deportes',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
