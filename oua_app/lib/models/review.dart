
class Review {
  final String username;
  final double rating;
  final String comment;
  bool isLiked;
  bool isDisliked;

  Review({
    required this.username,
    required this.rating,
    required this.comment,
    this.isLiked = false,
    this.isDisliked = false,
  });
}


