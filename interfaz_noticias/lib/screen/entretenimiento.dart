import 'package:flutter/material.dart';

class Entretenimiento extends StatefulWidget {
  const Entretenimiento({super.key});

  @override
  State<Entretenimiento> createState() => EntretenimientoState();
}

class EntretenimientoState extends State<Entretenimiento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entretenimiento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sección: Entretenimiento',
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
              Icon(Icons.movie, size: 40),
              SizedBox(width: 8),
              Text(
                'Entretenimiento',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
