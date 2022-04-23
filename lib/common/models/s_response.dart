class SResponse {
  final dynamic data;
  final String message;

  SResponse({this.data, required this.message});

  factory SResponse.fromJson(Map<String, dynamic> json) {
    return SResponse(
      data: json["data"],
      message: json["message:"]
    );
  }
}