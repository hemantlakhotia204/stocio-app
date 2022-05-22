class SResponse {
  final dynamic data;
  final String? msg;
  final int? statusCode;

  SResponse({required this.data, required this.msg, required this.statusCode});

  factory SResponse.fromJson(Map<String, dynamic> json) {
    return SResponse(
      data: json["data"],
      msg: json["msg"],
      statusCode: json['statusCode']
    );
  }
}