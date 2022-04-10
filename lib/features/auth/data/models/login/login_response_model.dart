class LoginResponseModel {
  LoginResponseModel({
    required this.success,
    this.expiresAt,
    this.requestToken,
    required this.statusMessage,
  });

  final bool success;
  final String? expiresAt;
  final String? requestToken;
  final String? statusMessage;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        requestToken: json['request_token'] ?? '',
        success: json['success'],
        expiresAt: json['expires_at'] ?? '',
        statusMessage: json['status_message'],
      );
}
