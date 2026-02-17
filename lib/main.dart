import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppJerseys());
}

class MiAppJerseys extends StatelessWidget {
  const MiAppJerseys({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tienda de Jerseys',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const PantallaJerseys(),
    );
  }
}

class PantallaJerseys extends StatelessWidget {
  const PantallaJerseys({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de jerseys (simulando datos de Firebase)
    final jerseys = [
      {
        'nombre': 'Jersey Barcelona',
        'equipo': 'Barcelona',
        'url':
            'https://raw.githubusercontent.com/alanorozco74/act10alanorozco/main/barca.jpg',
      },
      {
        'nombre': 'Jersey Real Madrid',
        'equipo': 'Real Madrid',
        'url':
            'https://raw.githubusercontent.com/alanorozco74/act10alanorozco/refs/heads/main/real%20madrid.jpg',
      },
      {
        'nombre': 'Jersey Chivas',
        'equipo': 'Chivas',
        'url':
            'https://raw.githubusercontent.com/alanorozco74/act10alanorozco/refs/heads/main/chivas.png',
      },
      {
        'nombre': 'Jersey Chelsea',
        'equipo': 'Chelsea',
        'url':
            'https://raw.githubusercontent.com/alanorozco74/act10alanorozco/refs/heads/main/chealsea.jpg',
      },
      {
        'nombre': 'Jersey Man United',
        'equipo': 'Man United',
        'url':
            'https://raw.githubusercontent.com/alanorozco74/act10alanorozco/refs/heads/main/man%20united.jpg',
      },
      {
        'nombre': 'Jersey America',
        'equipo': 'America',
        'url':
            'https://raw.githubusercontent.com/alanorozco74/act10alanorozco/refs/heads/main/america.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Jerseys',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemCount: jerseys.length,
              itemBuilder: (context, index) {
                final jersey = jerseys[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.all(color: Colors.black, width: 1.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            jersey['url']!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image,
                                    color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Jersey ${jersey['equipo']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Wacamaya Sports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
