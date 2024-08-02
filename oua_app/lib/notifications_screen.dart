import 'package:flutter/material.dart';
import 'my_bookings_screen.dart';
import 'main.dart';
import 'parking_details_screen.dart';
import 'models/parking_lot.dart';

class Notification {
  final String message;
  final DateTime dateTime;
  final String screen;
  final ParkingLot? parkingLot;

  Notification({required this.message, required this.dateTime, required this.screen, this.parkingLot});
}

class NotificationsScreen extends StatelessWidget {
  final List<Notification> notifications = [
    Notification(
      message: 'Your have a reservation at Lotus Plaza in 1 hour.',
      dateTime: DateTime(2024, 4, 12, 10, 0),
      screen: 'myBookings',
    ),
    Notification(
      message: 'There is no space left at NRT Tower, choose another car park.',
      dateTime: DateTime(2024, 4, 11, 13, 25),
      screen: 'mainPage',
    ),
    Notification(
      message: 'There are 5 places left at NRT Tower, hurry!',
      dateTime: DateTime(2024, 4, 11, 13, 15),
      screen: 'parkingDetails',
      parkingLot: ParkingLot(name: 'NRT Tower', location: 'Some location...', rating: 5.0, distance: 1.0, pricePerHour: 100, time: '06 AM - 10 PM', availableSpots: 5, status: 'Available', latitude: 0.0, longitude: 0.0, reviews: []),
    ),
    Notification(
      message: 'There are 10 places left at NRT Tower!',
      dateTime: DateTime(2024, 4, 11, 13, 0),
      screen: 'parkingDetails',
      parkingLot: ParkingLot(name: 'NRT Tower', location: 'Some location...', rating: 5.0, distance: 1.0, pricePerHour: 100, time: '06 AM - 10 PM', availableSpots: 10, status: 'Available', latitude: 0.0, longitude: 0.0, reviews: []),
    ),
    Notification(
      message: 'Your reservation at Maruthi Plaza will end in 30 minutes.',
      dateTime: DateTime(2024, 4, 10, 15, 0),
      screen: 'myBookings',
    ),
  ];

  void _navigateToScreen(BuildContext context, Notification notification) {
    switch (notification.screen) {
      case 'myBookings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyBookingsScreen()),
        );
        break;
      case 'mainPage':
        Navigator.popUntil(context, ModalRoute.withName('/'));
        break;
      case 'parkingDetails':
        if (notification.parkingLot != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParkingDetailsScreen(parkingLot: notification.parkingLot!)),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(notification.message),
              subtitle: Text('${notification.dateTime.toString().substring(0, 16)}'),
              trailing: TextButton(
                onPressed: () => _navigateToScreen(context, notification),
                child: Text(
                  notification.screen == 'myBookings' ? 'My Bookings' : notification.screen == 'mainPage' ? 'Main Page' : 'Otopark\'s Profile',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
