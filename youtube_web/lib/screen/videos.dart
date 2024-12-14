import 'package:flutter/material.dart';

void main() {
  runApp(const VideoPlatformApp());
}

class VideoPlatformApp extends StatelessWidget {
  const VideoPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const VideoPlatformScreen(),
        '/list': (context) => const VideoListScreen(),
      },
    );
  }
}

// Lógica de la plataforma de video
class VideoPlatform {
  final Map<String, int> videos = {};

  void uploadVideo(String title, int duration) {
    videos[title] = duration;
    print("Video '$title' subido con duración de $duration minutos.");
  }

  void removeVideo(String title) {
    if (videos.containsKey(title)) {
      videos.remove(title);
      print("Video '$title' eliminado.");
    } else {
      print("El video '$title' no existe.");
    }
  }

  void displayVideos(BuildContext context) {
    if (videos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No hay videos disponibles.")),
      );
    } else {
      Navigator.pushNamed(context, '/list', arguments: this);
    }
  }
}

// Pantalla principal donde se gestionan los videos
class VideoPlatformScreen extends StatefulWidget {
  const VideoPlatformScreen({super.key});

  @override
  _VideoPlatformScreenState createState() => _VideoPlatformScreenState();
}

class _VideoPlatformScreenState extends State<VideoPlatformScreen> {
  final VideoPlatform platform = VideoPlatform();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Videos iniciales
    platform.uploadVideo("Video 1", 10);
    platform.uploadVideo("Video 2", 15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subir Videos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título del Video',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: durationController,
                  decoration: const InputDecoration(
                    labelText: 'Duración (minutos)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String title = titleController.text;
                        int? duration = int.tryParse(durationController.text);
                        if (title.isNotEmpty && duration != null) {
                          setState(() {
                            platform.uploadVideo(title, duration);
                          });
                        }
                      },
                      child: const Text("Subir Video"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        platform.displayVideos(context); // Mostrar lista
                      },
                      child: const Text("Ver Videos"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    durationController.dispose();
    super.dispose();
  }
}

// Pantalla para mostrar la lista de videos
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late VideoPlatform platform;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    platform = ModalRoute.of(context)!.settings.arguments as VideoPlatform;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Videos'),
      ),
      body: platform.videos.isEmpty
          ? const Center(child: Text("No hay videos disponibles."))
          : ListView.builder(
              itemCount: platform.videos.length,
              itemBuilder: (context, index) {
                String title = platform.videos.keys.elementAt(index);
                int duration = platform.videos.values.elementAt(index);
                return ListTile(
                  title: Text(title),
                  subtitle: Text("Duración: $duration minutos"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        platform.removeVideo(title);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
