class SResponse {
  final dynamic data;
  final dynamic msg;

  SResponse({this.data, this.msg});

  factory SResponse.fromJson(Map<String, dynamic> json) {
    return SResponse(
      data: json["data"],
      msg: json["message:"]
    );
  }
}