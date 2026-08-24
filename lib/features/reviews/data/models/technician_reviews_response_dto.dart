class TechnicianReviewsResponseDto {
  final List<TechnicianReviewDto> data;
  final TechnicianReviewsMetaDto meta;

  TechnicianReviewsResponseDto({required this.data, required this.meta});

  factory TechnicianReviewsResponseDto.fromJson(Map<String, dynamic> json) {
    return TechnicianReviewsResponseDto(
      data: (json['data'] as List? ?? const [])
          .map(
            (item) => TechnicianReviewDto.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
      meta: TechnicianReviewsMetaDto.fromJson(
        Map<String, dynamic>.from(json['meta'] as Map? ?? const {}),
      ),
    );
  }
}

class TechnicianReviewsMetaDto {
  final int page;
  final int totalPages;
  final String? averageRating;

  TechnicianReviewsMetaDto({
    required this.page,
    required this.totalPages,
    this.averageRating,
  });

  factory TechnicianReviewsMetaDto.fromJson(Map<String, dynamic> json) =>
      TechnicianReviewsMetaDto(
        page: (json['page'] as num?)?.toInt() ?? 1,
        totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
        averageRating: json['averageRating']?.toString(),
      );
}

class TechnicianReviewDto {
  final String? id;
  final String? comment;
  final String? rating;
  final String? customerName;

  TechnicianReviewDto({this.id, this.comment, this.rating, this.customerName});

  factory TechnicianReviewDto.fromJson(Map<String, dynamic> json) =>
      TechnicianReviewDto(
        id: json['id']?.toString(),
        comment: json['comment']?.toString(),
        rating: json['rating']?.toString(),
        customerName: (json['customer'] as Map?)?['fullName']?.toString(),
      );
}
