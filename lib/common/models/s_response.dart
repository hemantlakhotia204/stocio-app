class SResponse {
  final dynamic data;
  final dynamic msg;
  final int statusCode;

  SResponse({this.data, this.msg, required this.statusCode});

  factory SResponse.fromJson(Map<String, dynamic> json) {
    return SResponse(
      data: json["data"],
      msg: json["message"],
      statusCode: json['statusCode']
    );
  }
}