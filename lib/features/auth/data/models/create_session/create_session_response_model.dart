class CreateSessionResponseModel {
  final bool success;
  final String? statusCode;
  final String? statusMessage;
  final String sessionId;

  CreateSessionResponseModel({
    required this.success,
    this.statusCode,
    this.statusMessage,
    required this.sessionId,
  });

  factory CreateSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateSessionResponseModel(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        sessionId: json['session_id'],
      );
}
