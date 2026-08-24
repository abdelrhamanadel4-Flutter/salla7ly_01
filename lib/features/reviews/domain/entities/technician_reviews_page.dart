class TechnicianReviewsPage {
  final List<TechnicianReview> reviews;
  final double? averageRating;
  final int page;
  final int totalPages;

  TechnicianReviewsPage({
    required this.reviews,
    this.averageRating,
    required this.page,
    required this.totalPages,
  });
}

class TechnicianReview {
  final String? id;
  final String? comment;
  final double rating;
  final String? customerName;

  TechnicianReview({
    this.id,
    this.comment,
    required this.rating,
    this.customerName,
  });
}
