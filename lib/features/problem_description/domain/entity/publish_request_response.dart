class PublishRequestResponse {
  final PublishRequestData? data;

  PublishRequestResponse({
    this.data,
  });
}

class PublishRequestData {
  final PublishRequest? request;
  final int? technicianCount;

  PublishRequestData({
    this.request,
    this.technicianCount,
  });
}

class PublishRequest {
  final String? id;
  final String? status;

  PublishRequest({
    this.id,
    this.status,
  });
}
