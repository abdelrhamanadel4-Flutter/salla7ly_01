class CustomerOffer {
  final String? offerId;
  final String? requestId;
  final num? price;
  final num? consultationFee;
  final String? status;
  final String? createdAt;
  final OfferTechnician? technician;

  CustomerOffer({
    this.offerId,
    this.requestId,
    this.price,
    this.consultationFee,
    this.status,
    this.createdAt,
    this.technician,
  });
}

class OfferTechnician {
  final String? id;
  final String? fullName;
  final String? phone;
  final String? categoryName;
  final String? city;
  final String? address;
  final double? overallRating;
  final int? totalReviews;
  final String? profileImage;
  final num? distanceKm;

  OfferTechnician({
    this.id,
    this.fullName,
    this.phone,
    this.categoryName,
    this.city,
    this.address,
    this.overallRating,
    this.totalReviews,
    this.profileImage,
    this.distanceKm,
  });
}
