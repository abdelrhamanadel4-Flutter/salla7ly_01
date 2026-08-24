import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/features/problem_description/data/models/offers_response_dto.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/requsets/data/models/technician_jobs_response_dto.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';

class SocketEvents {
  SocketEvents._();

  static const String jobNew = 'job:new';
  static const String jobClosed = 'job:closed';
  static const String jobSelected = 'job:selected';

  static const String offerNew = 'offer:new';
  static const String requestUpdated = 'request:updated';
}

class OfferNewEvent {
  final String? requestId;
  final CustomerOffer? offer;

  OfferNewEvent({this.requestId, this.offer});

  factory OfferNewEvent.fromJson(Map<String, dynamic> json) {
    return OfferNewEvent(
      requestId: json['requestId'] as String?,
      offer: json['offer'] == null
          ? null
          : OfferDto.fromJson(
              Map<String, dynamic>.from(json['offer'] as Map),
            ).toEntity(),
    );
  }
}

class RequestUpdatedEvent {
  final String? requestId;
  final String? status;

  RequestUpdatedEvent({this.requestId, this.status});

  factory RequestUpdatedEvent.fromJson(Map<String, dynamic> json) {
    return RequestUpdatedEvent(
      requestId: json['requestId'] as String?,
      status: json['status'] as String?,
    );
  }
}

class JobNewEvent {
  final TechnicianJob job;
  JobNewEvent(this.job);

  factory JobNewEvent.fromJson(Map<String, dynamic> json) {
    return JobNewEvent(TechnicianJobDto.fromJson(json).toDomain());
  }
}

class JobClosedEvent {
  final String? requestId;
  final String? reason;

  JobClosedEvent({this.requestId, this.reason});

  factory JobClosedEvent.fromJson(Map<String, dynamic> json) {
    return JobClosedEvent(
      requestId: json['requestId'] as String?,
      reason: json['reason'] as String?,
    );
  }
}
