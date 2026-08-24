class AcceptOfferResponse {
  final AcceptOfferData? data;

  AcceptOfferResponse({this.data});
}

class AcceptOfferData {
  final AcceptedRequest? request;
  final AcceptedTechnician? technician;

  AcceptOfferData({this.request, this.technician});
}

class AcceptedRequest {
  final String? id;
  final String? status;

  AcceptedRequest({this.id, this.status});
}

class AcceptedTechnician {
  final String? id;
  final String? fullName;
  final String? phone;

  AcceptedTechnician({this.id, this.fullName, this.phone});
}
