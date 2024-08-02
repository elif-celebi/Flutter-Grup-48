import 'package:flutter/material.dart';

class MyDocumentsScreen extends StatelessWidget {
  final List<Map<String, String>> documents = [
    {'title': 'Yapı kullanma izin belgesi*', 'description': ''},
    {'title': 'Otopark ruhsatı*', 'description': ''},
    {'title': 'Tapu Belgesi Fotoğraf', 'description': 'Tapu kütüğünün beyanlar hanesinin ekran görüntüsü.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Document'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(document['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: document['description']!.isNotEmpty ? Text(document['description']!) : null,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.cloud_upload, color: Colors.blue),
                    onPressed: () {
                      // Upload işlemleri
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Silme işlemleri
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
