class CustomerTechReviewsResponseDto {
  final List<CustomerTechReviewDto> data;
  final CustomerTechReviewsMetaDto? meta;

  CustomerTechReviewsResponseDto({required this.data, this.meta});

  factory CustomerTechReviewsResponseDto.fromJson(Map<String, dynamic> json) {
    return CustomerTechReviewsResponseDto(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((item) => CustomerTechReviewDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : CustomerTechReviewsMetaDto.fromJson(
              json['meta'] as Map<String, dynamic>,
            ),
    );
  }
}

class CustomerTechReviewsMetaDto {
  final String? averageRating;

  CustomerTechReviewsMetaDto({this.averageRating});

  factory CustomerTechReviewsMetaDto.fromJson(Map<String, dynamic> json) {
    return CustomerTechReviewsMetaDto(
      averageRating: json['averageRating'] as String?,
    );
  }
}

class CustomerTechReviewDto {
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

  CustomerTechReviewDto({
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

  factory CustomerTechReviewDto.fromJson(Map<String, dynamic> json) {
    return CustomerTechReviewDto(
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
