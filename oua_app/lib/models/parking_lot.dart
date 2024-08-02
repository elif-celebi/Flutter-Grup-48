import 'review.dart';

class ParkingLot {
  final String name;
  final String location;
  final double rating;
  final double distance;
  final int pricePerHour;
  final String time;
  final int availableSpots;
  final String status;
  final double latitude;
  final double longitude;
  final List<Review> reviews;

  ParkingLot({
    required this.name,
    required this.location,
    required this.rating,
    required this.distance,
    required this.pricePerHour,
    required this.time,
    required this.availableSpots,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.reviews,
  });

  ParkingLot copyWith({
    String? name,
    String? location,
    double? rating,
    double? distance,
    int? pricePerHour,
    String? time,
    int? availableSpots,
    String? status,
    double? latitude,
    double? longitude,
    List<Review>? reviews,
  }) {
    return ParkingLot(
      name: name ?? this.name,
      location: location ?? this.location,
      rating: rating ?? this.rating,
      distance: distance ?? this.distance,
      pricePerHour: pricePerHour ?? this.pricePerHour,
      time: time ?? this.time,
      availableSpots: availableSpots ?? this.availableSpots,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      reviews: reviews ?? this.reviews,
    );
  }
}


