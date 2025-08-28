class ResetPasswordResponse {
  ResetPasswordResponse({
    this.message,
    this.error,
    this.statusCode,
  });

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }

  dynamic message;
  String? error;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['statusCode'] = statusCode;
    return map;
  }
}
