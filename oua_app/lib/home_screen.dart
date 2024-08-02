import 'package:flutter/material.dart';
import 'package:oua_app/favourites_screen.dart';
import 'package:oua_app/make_complaints_screen.dart';
import 'package:oua_app/manage_parking_lot_screen.dart';
import 'package:oua_app/my_parking_lot_profile_screen.dart';
import 'package:oua_app/notifications_screen.dart';
import 'package:oua_app/reservation_screen.dart';
import 'package:oua_app/sort_options_screen.dart';
import 'package:oua_app/filters_screen.dart';
import 'hit_the_road_screen.dart';
import 'models/parking_lot.dart';
import 'models/review.dart';
import 'my_bookings_screen.dart';
import 'parking_details_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<ParkingLot> parkingLots = [
    ParkingLot(
      name: 'NTR Towers',
      location: 'Venkata Ramana Colony...',
      rating: 5.0,
      distance: 1.04,
      pricePerHour: 400,
      time: '06 AM - 10 PM',
      availableSpots: 19,
      status: 'Available',
      latitude: 17.3850,
      longitude: 78.4867,
      reviews: [
        Review(comment: 'Great parking spot!', rating: 5.0, username: 'Elif çelebi'),
        Review(comment: 'Very secure and clean.', rating: 4.0, username: 'Yusuf Emre Öner'),
        Review(comment: 'Clean.', rating: 3.0, username: 'Ece Önbaş'),
      ],
    ),
    ParkingLot(
      name: 'Maruthi Plaza',
      location: 'Venkata Ramana Colony...',
      rating: 4.5,
      distance: 1.5,
      pricePerHour: 300,
      time: '06 AM - 10 PM',
      availableSpots: 0,
      status: 'Full',
      latitude: 17.3850,
      longitude: 78.4867,
      reviews: [
        Review(comment: 'Affordable but crowded.', rating: 3.0, username: ''),
        Review(comment: 'Convenient location.', rating: 4.0, username: ''),
      ],
    ),
    ParkingLot(
      name: 'NRK Towers',
      location: 'Venkata Ramana Colony...',
      rating: 4.8,
      distance: 0.8,
      pricePerHour: 350,
      time: '06 AM - 10 PM',
      availableSpots: 1,
      status: 'Available',
      latitude: 17.3850,
      longitude: 78.4867,
      reviews: [
        Review(comment: 'Excellent service.', rating: 5.0, username: ''),
        Review(comment: 'Very clean.', rating: 4.0, username: ''),
      ],
    ),
    ParkingLot(
      name: 'Lotus Nest',
      location: 'Venkata Ramana Colony...',
      rating: 4.7,
      distance: 2.0,
      pricePerHour: 450,
      time: '06 AM - 10 PM',
      availableSpots: 5,
      status: 'Available',
      latitude: 17.3850,
      longitude: 78.4867,
      reviews: [
        Review(comment: 'Spacious and secure.', rating: 5.0, username: ''),
        Review(comment: 'A bit expensive.', rating: 3.0, username: ''),
      ],
    ),
  ];

  void _showBookingBottomSheet(BuildContext context, ParkingLot parkingLot) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BookingBottomSheet(parkingLot: parkingLot);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parkings near by'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Filter action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Burak Başlık"),
              accountEmail: Text("burakbaslik@parkmaster.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/profil.jpg"),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('My Bookings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBookingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favourites'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavouritesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Make Complaints'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MakeComplaintsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('My Parking Lot Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyParkingLotProfile(parkingLot: parkingLots[0])),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Manage Your Parking Lot'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageParkingLotScreen(parkingLot: parkingLots[0])),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Logout action
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search location',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  /*TextField(
                    decoration: InputDecoration(
                      hintText: 'How many hours do you plan to park your car?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 10),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today_outlined),
                            SizedBox(width: 5),
                            Text('Date'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FiltersScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.filter_list),
                            SizedBox(width: 5),
                            Text('Filters'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => SortOptionsScreen(
                              onSortSelected: (sortOption) {
                                // Burada sıralama seçeneğine göre işlemler yapabilirsiniz.
                                print('Selected Sort Option: $sortOption');
                              },
                              onDistanceChanged: (distance) {
                                // Burada mesafe değişikliğine göre işlemler yapabilirsiniz.
                                print('Selected Distance: $distance');
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.sort),
                            SizedBox(width: 5),
                            Text('Sort'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: parkingLots.length,
                itemBuilder: (context, index) {
                  final parkingLot = parkingLots[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        'Recommended',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.local_parking, color: parkingLot.status == 'Available' ? Colors.green : Colors.red),
                                    SizedBox(width: 10),
                                    Text(
                                      parkingLot.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.star, color: Colors.amber, size: 16),
                                    Text(parkingLot.rating.toString()),
                                  ],
                                ),
                              ),
                              Text(
                                '₹${parkingLot.pricePerHour}/hr',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            parkingLot.location,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16, color: Colors.grey),
                              SizedBox(width: 5),
                              Text('${parkingLot.distance} km'),
                              SizedBox(width: 15),
                              Icon(Icons.access_time, size: 16, color: Colors.grey),
                              SizedBox(width: 5),
                              Text(parkingLot.time),
                              SizedBox(width: 15),
                              Icon(Icons.event_seat, size: 16, color: parkingLot.status == 'Available' ? Colors.green : Colors.red),
                              SizedBox(width: 5),
                              Text(parkingLot.status == 'Available' ? '${parkingLot.availableSpots} left' : 'Full'),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text('Parking Price: ${parkingLot.pricePerHour} TL'),
                              SizedBox(width: 10),
                              Text('Reservation Price: ${parkingLot.pricePerHour} TL'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ParkingDetailsScreen(parkingLot: parkingLot)),
                                  );
                                },
                                child: Text(
                                  'View details',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _showBookingBottomSheet(context, parkingLot);
                                    },
                                    child: Text('Book Now', style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HitTheRoadScreen(parkingLot: parkingLot)),
                                      );
                                    },
                                    child: Text('Hit The Road', style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BookingBottomSheet extends StatefulWidget {
  final ParkingLot parkingLot;

  BookingBottomSheet({required this.parkingLot});

  @override
  _BookingBottomSheetState createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  DateTime? _selectedDate;
  TimeOfDay? _entryTime;
  TimeOfDay? _exitTime;
  double _totalPrice = 0;

  void _calculatePrice() {
    if (_entryTime != null && _exitTime != null) {
      final entry = Duration(hours: _entryTime!.hour, minutes: _entryTime!.minute);
      final exit = Duration(hours: _exitTime!.hour, minutes: _exitTime!.minute);
      final duration = exit - entry;
      final hours = duration.inMinutes / 60.0;

      setState(() {
        _totalPrice = hours * widget.parkingLot.pricePerHour;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context, bool isEntry) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isEntry) {
          _entryTime = picked;
        } else {
          _exitTime = picked;
        }
        _calculatePrice();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Select your Timeline',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Select your Time and Date',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(_selectedDate == null ? 'Select Date' : _selectedDate.toString().split(' ')[0]),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _selectTime(context, true),
                  child: Text(_entryTime == null ? 'Entry Time' : _entryTime!.format(context)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _selectTime(context, false),
                  child: Text(_exitTime == null ? 'Exit Time' : _exitTime!.format(context)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_totalPrice.toStringAsFixed(2)} TL',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationScreen(parkingLot: widget.parkingLot, totalPrice: _totalPrice)),
                  );
                },
                child: Text('Book Now',style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

