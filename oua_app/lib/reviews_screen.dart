import 'package:flutter/material.dart';
import 'models/review.dart';
import 'models/parking_lot.dart';
import 'add_comment_screen.dart';

class ReviewsScreen extends StatefulWidget {
  final ParkingLot parkingLot;

  ReviewsScreen({required this.parkingLot});

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late List<Review> reviews;

  @override
  void initState() {
    super.initState();
    reviews = widget.parkingLot.reviews;
  }

  void _addReview(Review review) {
    setState(() {
      reviews.add(review);
    });
  }

  void _toggleLike(Review review) {
    setState(() {
      review.isLiked = !review.isLiked;
      if (review.isLiked) {
        review.isDisliked = false;
      }
    });
  }

  void _toggleDislike(Review review) {
    setState(() {
      review.isDisliked = !review.isDisliked;
      if (review.isDisliked) {
        review.isLiked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCommentScreen(
                          parkingLot: widget.parkingLot,
                          onReviewAdded: _addReview,
                        ),
                      ),
                    );
                  },
                  child: Text('Add New Comment'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
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
                              Text(
                                review.username,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 10),
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    Icons.star,
                                    color: starIndex < review.rating ? Colors.amber : Colors.grey,
                                    size: 16,
                                  );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            review.comment,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  review.isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                                  size: 16,
                                  color: review.isLiked ? Colors.blue : null,
                                ),
                                onPressed: () {
                                  _toggleLike(review);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  review.isDisliked ? Icons.thumb_down : Icons.thumb_down_alt_outlined,
                                  size: 16,
                                  color: review.isDisliked ? Colors.red : null,
                                ),
                                onPressed: () {
                                  _toggleDislike(review);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
