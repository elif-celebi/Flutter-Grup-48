import 'package:flutter/material.dart';
import 'models/parking_lot.dart';
import 'models/reservation.dart';

class ManageParkingLotScreen extends StatefulWidget {
  final ParkingLot parkingLot;

  ManageParkingLotScreen({required this.parkingLot});

  @override
  _ManageParkingLotScreenState createState() => _ManageParkingLotScreenState();
}

class _ManageParkingLotScreenState extends State<ManageParkingLotScreen> {
  TimeOfDay? _selectedEntryTime;
  DateTime? _selectedEntryDate;
  double totalEarnings = 3000;
  int totalSpots = 100;
  int leftSpots = 40;
  List<Reservation> reservations = [
    Reservation(name: 'Selin Türker', date: DateTime(2024, 4, 15), time: '11:00 - 12:00', amount: 180, status: 'paid'),
    Reservation(name: 'Ahmet Sezin', date: DateTime(2024, 4, 14), time: '12:00 - 13:00', amount: 180, status: 'paid'),
    Reservation(name: 'Ayşe Kızıl', date: DateTime(2024, 4, 13), time: '10:00 - 12:00', amount: 180, status: 'paid'),
    Reservation(name: 'Mehmet Kırkdağ', date: DateTime(2024, 4, 12), time: '15:00 - 17:00', amount: 180, status: 'paid'),
    Reservation(name: 'Füsun Keskin', date: DateTime(2024, 4, 12), time: '10:00 - 12:00', amount: 180, status: 'paid'),
  ];
  List<Reservation> filteredReservations = [];

  @override
  void initState() {
    super.initState();
    filteredReservations = reservations;
  }

  void _filterReservations() {
    setState(() {
      filteredReservations = reservations.where((reservation) {
        bool matchesTime = true;
        bool matchesDate = true;

        if (_selectedEntryTime != null) {
          final entryTime = Duration(hours: _selectedEntryTime!.hour, minutes: _selectedEntryTime!.minute);
          final reservationTimeStart = Duration(
            hours: int.parse(reservation.time.split('-')[0].trim().split(':')[0]),
            minutes: int.parse(reservation.time.split('-')[0].trim().split(':')[1]),
          );
          final reservationTimeEnd = Duration(
            hours: int.parse(reservation.time.split('-')[1].trim().split(':')[0]),
            minutes: int.parse(reservation.time.split('-')[1].trim().split(':')[1]),
          );

          if (entryTime < reservationTimeStart || entryTime >= reservationTimeEnd) {
            matchesTime = false;
          }
        }

        if (_selectedEntryDate != null && _selectedEntryDate != reservation.date) {
          matchesDate = false;
        }

        return matchesTime && matchesDate;
      }).toList();
    });
  }

  void _resetFilters() {
    setState(() {
      _selectedEntryTime = null;
      _selectedEntryDate = null;
      filteredReservations = reservations;
    });
  }

  Future<void> _selectEntryTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedEntryTime) {
      setState(() {
        _selectedEntryTime = picked;
        _filterReservations();
      });
    }
  }

  Future<void> _selectEntryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedEntryDate) {
      setState(() {
        _selectedEntryDate = picked;
        _filterReservations();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Your Parking Lot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _selectEntryTime(context),
                  child: Text(_selectedEntryTime == null ? 'Entry Time' : _selectedEntryTime!.format(context)),
                ),
                ElevatedButton(
                  onPressed: () => _selectEntryDate(context),
                  child: Text(_selectedEntryDate == null ? 'Entry Date' : '${_selectedEntryDate!.day}/${_selectedEntryDate!.month}/${_selectedEntryDate!.year}'),
                ),
                ElevatedButton(
                  onPressed: _resetFilters,
                  child: Text('Show All'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total spot: $totalSpots', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Left Spot: $leftSpots', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Text('You\'ve earned: $totalEarnings TL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredReservations.length,
                itemBuilder: (context, index) {
                  final reservation = filteredReservations[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(reservation.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${reservation.date.day} ${reservation.date.month} ${reservation.date.year}, ${reservation.time}'),
                          Text('${reservation.amount} TL (${reservation.status})'),
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

