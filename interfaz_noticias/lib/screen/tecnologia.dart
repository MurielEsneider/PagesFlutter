import 'package:flutter/material.dart';

class Tecnologia extends StatefulWidget {
  const Tecnologia({super.key});

  @override
  State<Tecnologia> createState() => TecnologiaState();
}

class TecnologiaState extends State<Tecnologia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tecnología'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sección: Tecnología',
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
                'Tecnología',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
