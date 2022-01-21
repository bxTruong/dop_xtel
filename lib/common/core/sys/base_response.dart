class BaseResponse {
  String? requestId;
  String? at;
  Error? error;
  dynamic data;

  BaseResponse({this.requestId, this.at, this.error, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    at = json['at'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestId'] = requestId;
    data['at'] = at;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
