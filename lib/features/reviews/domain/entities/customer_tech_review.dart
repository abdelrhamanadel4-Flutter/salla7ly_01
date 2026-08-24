class CustomerTechReview {
  final String? id;
  final String? rating;
  final int? punctuality;
  final int? serviceQuality;
  final int? professionalism;
  final int? priceFairness;
  final String? actualPaidPrice;
  final String? comment;
  final String? customerName;
  final String? createdAt;

  CustomerTechReview({
    this.id,
    this.rating,
    this.punctuality,
    this.serviceQuality,
    this.professionalism,
    this.priceFairness,
    this.actualPaidPrice,
    this.comment,
    this.customerName,
    this.createdAt,
  });
}

class CustomerTechReviewsData {
  final List<CustomerTechReview> reviews;
  final String? averageRating;

  CustomerTechReviewsData({required this.reviews, this.averageRating});
}
