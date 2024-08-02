import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  @override
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  int _selectedIndex = 0;

  List<Map<String, String>> activeBookings = [
    {
      'date': '12 Apr 2024',
      'name': 'NTR Towers',
      'location': 'Venkata Ramana Colony...',
      'status': 'Active',
      'directions': 'Get Directions',
      'time': 'now - 11:00 AM',
      'timeLeft': '40 min left'
    }
  ];

  List<Map<String, String>> completedBookings = [
    {
      'date': '01 Apr 2024',
      'name': 'NTR Towers',
      'location': 'Venkata Ramana Colony...',
      'price': '150 TL',
      'time': '11:00 AM - 15:00 PM',
      'status': 'Completed',
      'directions': 'Get Directions',
      'availableSpots': '13 left'
    },
    {
      'date': '21 Dec 2023',
      'name': 'Maruthi Plaza',
      'location': 'Venkata Ramana Colony...',
      'price': '180 TL',
      'time': '20:00 PM',
      'status': 'Completed',
      'directions': 'Get Directions',
      'availableSpots': '5 left'
    }
  ];

  List<Map<String, String>> cancelledBookings = [
    {
      'date': '01 Apr 2024',
      'name': 'Udaya Polygon',
      'location': 'Venkata Ramana Colony...',
      'price': '150 TL',
      'time': '11:00 AM - 15:00 PM',
      'status': 'Cancelled',
      'directions': 'Get Directions',
      'availableSpots': '25 left'
    },
    {
      'date': '21 Dec 2023',
      'name': 'Lotus Nest',
      'location': 'Venkata Ramana Colony...',
      'price': '150 TL',
      'time': '20:00 PM',
      'status': 'Cancelled',
      'directions': 'Get Directions',
      'availableSpots': '3 left'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabButton('Active', 0),
              _buildTabButton('Completed', 1),
              _buildTabButton('Cancelled', 2),
            ],
          ),
          Expanded(
            child: _selectedIndex == 0
                ? _buildActiveBookings()
                : _selectedIndex == 1
                ? _buildCompletedBookings()
                : _buildCancelledBookings(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.blue : Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveBookings() {
    return ListView.builder(
      itemCount: activeBookings.length,
      itemBuilder: (context, index) {
        var booking = activeBookings[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      booking['date']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('View details'),
                    ),
                  ],
                ),
                Text(
                  booking['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(booking['location']!),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    booking['directions']!,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(booking['time']!),
                      ],
                    ),
                    Text(booking['timeLeft']!),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Cancel',style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
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
                        child: Text('Extend',style: TextStyle(color: Colors.white)),
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
    );
  }

  Widget _buildCompletedBookings() {
    return ListView.builder(
      itemCount: completedBookings.length,
      itemBuilder: (context, index) {
        var booking = completedBookings[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      booking['date']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('View details'),
                    ),
                  ],
                ),
                Text(
                  booking['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(booking['location']!),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    booking['directions']!,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(booking['time']!),
                      ],
                    ),
                    Text(booking['availableSpots']!),
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
    );
  }

  Widget _buildCancelledBookings() {
    return ListView.builder(
      itemCount: cancelledBookings.length,
      itemBuilder: (context, index) {
        var booking = cancelledBookings[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      booking['date']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('View details'),
                    ),
                  ],
                ),
                Text(
                  booking['name']!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(booking['location']!),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    booking['directions']!,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(booking['time']!),
                      ],
                    ),
                    Text(booking['availableSpots']!),
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
    );
  }
}
