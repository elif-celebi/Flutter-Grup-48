import 'package:flutter/material.dart';
import 'models/parking_lot.dart';

class MyParkingLotProfile extends StatefulWidget {
  final ParkingLot parkingLot;

  MyParkingLotProfile({required this.parkingLot});

  @override
  _MyParkingLotProfileState createState() => _MyParkingLotProfileState();
}

class _MyParkingLotProfileState extends State<MyParkingLotProfile> {
  late ParkingLot _parkingLot;
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _parkingLot = widget.parkingLot;
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Parking Lot Profile'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveChanges,
            )
          else
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: _toggleEditMode,
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
              _isEditing
                  ? TextFormField(
                initialValue: _parkingLot.name,
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  setState(() {
                    _parkingLot = _parkingLot.copyWith(name: value);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              )
                  : Text(
                _parkingLot.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Text('${_parkingLot.rating} (106 Reviews)'),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 10),
              _isEditing
                  ? TextFormField(
                initialValue: _parkingLot.location,
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (value) {
                  setState(() {
                    _parkingLot = _parkingLot.copyWith(location: value);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              )
                  : Text(_parkingLot.location),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('${_parkingLot.distance} km'),
                  SizedBox(width: 15),
                  Icon(Icons.access_time, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(_parkingLot.time),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _isEditing
                  ? TextFormField(
                initialValue: 'Central Parking Plaza offers convenient and secure parking in the heart of the city. With 24/7 access and ample space, it\'s the perfect choice for commuters and visitors alike.',
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  setState(() {
                    // Description kaydetme işlemi
                  });
                },
              )
                  : Text(
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
              Text(
                'Prices',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('0-2 hr:', style: TextStyle(fontSize: 16)),
                      Text('3-5 hr:', style: TextStyle(fontSize: 16)),
                      Text('5-8 hr:', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('All Day:', style: TextStyle(fontSize: 16)),
                    ],
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
