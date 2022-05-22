class SResponse {
  final dynamic data;
  final String? msg;
  final int? code;

  SResponse({required this.data, required this.msg, required this.code});

  factory SResponse.fromJson(Map<String, dynamic> json) {
    return SResponse(
      data: json["data"],
      msg: json["msg"],
      code: json['code']
    );
  }
}