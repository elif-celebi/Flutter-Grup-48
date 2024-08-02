import 'package:flutter/material.dart';
import 'package:oua_app/hit_the_road_screen.dart';
import 'models/parking_lot.dart';
import 'reservation_screen.dart';
import 'reviews_screen.dart';

class ParkingDetailsScreen extends StatelessWidget {
  final ParkingLot parkingLot;

  ParkingDetailsScreen({required this.parkingLot});

  void _showBookingBottomSheet(BuildContext context) {
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
        title: Text('Parking Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/oto-park.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Recommended',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.security, color: Colors.orange),
                  SizedBox(width: 5),
                  Text(
                    '100% Safety',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                parkingLot.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReviewsScreen(parkingLot: parkingLot)),
                      );
                    },
                    child: Text('${parkingLot.rating} (106 Reviews)'),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 10),
              Text(parkingLot.location),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('${parkingLot.distance} km'),
                  SizedBox(width: 15),
                  Icon(Icons.access_time, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(parkingLot.time),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Central Parking Plaza offers convenient and secure parking in the heart of the city. With 24/7 access and ample space, it\'s the perfect choice for commuters and visitors alike.',
              ),
              SizedBox(height: 20),
              Text(
                'Facilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text('CCTV')),
                  Chip(label: Text('Covered Parking')),
                  Chip(label: Text('Electric Vehicle charging')),
                  Chip(label: Text('Securely gated')),
                  Chip(label: Text('Security')),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showBookingBottomSheet(context);
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
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HitTheRoadScreen(parkingLot: parkingLot)),
                      );
                    },
                    child: Text('Hit The Road',style: TextStyle(color: Colors.white)),
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