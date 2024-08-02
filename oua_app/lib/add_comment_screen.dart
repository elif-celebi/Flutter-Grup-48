import 'package:flutter/material.dart';
import 'models/review.dart';
import 'models/parking_lot.dart';

class AddCommentScreen extends StatefulWidget {
  final ParkingLot parkingLot;
  final Function(Review) onReviewAdded;

  AddCommentScreen({required this.parkingLot, required this.onReviewAdded});

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.parkingLot.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'How many points for parking?',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = (index + 1).toDouble();
                      });
                    },
                  );
                }),
              ),
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please add your comment';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newReview = Review(
                        username: 'Burak Başlık',
                        rating: _rating,
                        comment: _commentController.text,
                      );
                      widget.onReviewAdded(newReview);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('New Comment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
