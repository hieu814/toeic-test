class ErrorRespondHandle {
  ErrorRespondHandle({
    required this.error,
  });
  late final Error error;

  ErrorRespondHandle.fromJson(Map<String, dynamic> json) {
    error = Error.fromJson(json['error']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error.toJson();
    return data;
  }
}

class Error {
  Error({
    required this.status,
    required this.name,
    required this.message,
  });
  late final String status;
  late final String name;
  late final String message;

  Error.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['name'] = name;
    data['message'] = message;
    return data;
  }
}
