import 'package:flutter/material.dart';
import 'models/parking_lot.dart';
import 'add_card_screen.dart';

class ReservationScreen extends StatefulWidget {
  final ParkingLot parkingLot;
  final double totalPrice;

  ReservationScreen({required this.parkingLot, required this.totalPrice});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<Map<String, String>> cards = [
    {
      'name': 'Frank smith',
      'number': '5100 4560 4000 7587',
      'expiryDate': '04 July 2023',
      'cvv': '509',
    },
  ];
  String? selectedCardNumber;

  @override
  void initState() {
    super.initState();
    selectedCardNumber = cards[0]['number'];
  }

  void _deleteCard(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this card?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  cards.removeAt(index);
                  if (selectedCardNumber == cards[index]['number']) {
                    selectedCardNumber = null;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/add-card.png',
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add New Card',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, size: 30, color: Colors.blue),
                  onPressed: () async {
                    final newCard = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCardScreen()),
                    );
                    if (newCard != null) {
                      setState(() {
                        cards.add(Map<String, String>.from(newCard));
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ...cards.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> card = entry.value;
              String cardNumber = card['number']!;
              return ListTile(
                leading: Icon(Icons.credit_card, color: Colors.blue),
                title: Text('Visa **** **** **** ${cardNumber.substring(cardNumber.length - 4)}'),
                subtitle: Text('Expiry ${card['expiryDate']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteCard(index);
                      },
                    ),
                    Icon(
                      selectedCardNumber == cardNumber ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: selectedCardNumber == cardNumber ? Colors.green : Colors.grey,
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    selectedCardNumber = cardNumber;
                  });
                },
              );
            }).toList(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.totalPrice.toStringAsFixed(2)} TL',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Book Now', style: TextStyle(color: Colors.white)),
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
    );
  }
}

