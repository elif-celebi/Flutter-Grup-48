import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Map<String, String>> favouriteParkings = [
    {
      'name': 'NTR Towers',
      'location': 'Venkata Ramana Colony...',
      'availableSpots': '5 left',
      'directions': 'Get Directions',
      'details': 'View details',
    },
    {
      'name': 'Maruthi Plaza',
      'location': 'Venkata Ramana Colony...',
      'availableSpots': '1 left',
      'directions': 'Get Directions',
      'details': 'View details',
    },
    {
      'name': 'Lotus Nest',
      'location': 'Venkata Ramana Colony...',
      'availableSpots': '12 left',
      'directions': 'Get Directions',
      'details': 'View details',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourites'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: favouriteParkings.length,
        itemBuilder: (context, index) {
          final parking = favouriteParkings[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        parking['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    parking['location']!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      parking['directions']!,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.event_seat, size: 16, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(parking['availableSpots']!),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          parking['details']!,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Hit The Road',style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Book Now',style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
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
