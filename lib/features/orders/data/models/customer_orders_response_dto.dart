class CustomerOrdersResponseDto {
  final List<CustomerOrderDto> data;
  final CustomerOrdersMetaDto? meta;

  CustomerOrdersResponseDto({required this.data, this.meta});

  factory CustomerOrdersResponseDto.fromJson(Map<String, dynamic> json) {
    final orders = json['data'] as List<dynamic>? ?? [];

    return CustomerOrdersResponseDto(
      data: orders
          .map((item) => CustomerOrderDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : CustomerOrdersMetaDto.fromJson(
              json['meta'] as Map<String, dynamic>,
            ),
    );
  }
}

class CustomerOrdersMetaDto {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;

  CustomerOrdersMetaDto({
    this.page,
    this.limit,
    this.total,
    this.totalPages,
  });

  factory CustomerOrdersMetaDto.fromJson(Map<String, dynamic> json) {
    return CustomerOrdersMetaDto(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      totalPages: json['totalPages'] as int?,
    );
  }
}

class CustomerOrderDto {
  final String? id;
  final String? title;
  final String? categoryName;
  final String? status;
  final String? requestType;
  final String? visitFee;
  final String? technicianName;
  final int? offersCount;
  final String? createdAt;

  CustomerOrderDto({
    this.id,
    this.title,
    this.categoryName,
    this.status,
    this.requestType,
    this.visitFee,
    this.technicianName,
    this.offersCount,
    this.createdAt,
  });

  factory CustomerOrderDto.fromJson(Map<String, dynamic> json) {
    return CustomerOrderDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      categoryName: json['categoryName'] as String?,
      status: json['status'] as String?,
      requestType: json['requestType'] as String?,
      visitFee: json['visitFee'] as String?,
      technicianName: json['technicianName'] as String?,
      offersCount: json['offersCount'] as int?,
      createdAt: json['createdAt'] as String?,
    );
  }
}
