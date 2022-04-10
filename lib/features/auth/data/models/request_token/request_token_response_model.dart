class RequestTokenResponseModel {
  RequestTokenResponseModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  final bool success;
  final String expiresAt;
  final String requestToken;

  factory RequestTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      RequestTokenResponseModel(
        requestToken: json['request_token'],
        success: json['success'],
        expiresAt: json['expires_at'],
      );
}
