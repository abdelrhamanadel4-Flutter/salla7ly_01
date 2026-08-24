class TechnicianReviewsResponseDto {
  final List<TechnicianReviewDto> data;
  final TechnicianReviewsMetaDto? meta;

  TechnicianReviewsResponseDto({required this.data, this.meta});

  factory TechnicianReviewsResponseDto.fromJson(Map<String, dynamic> json) {
    return TechnicianReviewsResponseDto(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((item) => TechnicianReviewDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : TechnicianReviewsMetaDto.fromJson(
              json['meta'] as Map<String, dynamic>,
            ),
    );
  }
}

class TechnicianReviewsMetaDto {
  final String? averageRating;

  TechnicianReviewsMetaDto({this.averageRating});

  factory TechnicianReviewsMetaDto.fromJson(Map<String, dynamic> json) {
    return TechnicianReviewsMetaDto(
      averageRating: json['averageRating'] as String?,
    );
  }
}

class TechnicianReviewDto {
  final String? id;
  final String? rating;
  final int? punctuality;
  final int? serviceQuality;
  final int? professionalism;
  final int? priceFairness;
  final String? actualPaidPrice;
  final String? comment;
  final ReviewCustomerDto? customer;
  final String? createdAt;

  TechnicianReviewDto({
    this.id,
    this.rating,
    this.punctuality,
    this.serviceQuality,
    this.professionalism,
    this.priceFairness,
    this.actualPaidPrice,
    this.comment,
    this.customer,
    this.createdAt,
  });

  factory TechnicianReviewDto.fromJson(Map<String, dynamic> json) {
    return TechnicianReviewDto(
      id: json['id'] as String?,
      rating: json['rating'] as String?,
      punctuality: json['punctuality'] as int?,
      serviceQuality: json['serviceQuality'] as int?,
      professionalism: json['professionalism'] as int?,
      priceFairness: json['priceFairness'] as int?,
      actualPaidPrice: json['actualPaidPrice'] as String?,
      comment: json['comment'] as String?,
      customer: json['customer'] == null
          ? null
          : ReviewCustomerDto.fromJson(json['customer'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );
  }
}

class ReviewCustomerDto {
  final String? fullName;

  ReviewCustomerDto({this.fullName});

  factory ReviewCustomerDto.fromJson(Map<String, dynamic> json) {
    return ReviewCustomerDto(fullName: json['fullName'] as String?);
  }
}
