class AccountDetailsRequestModel {
  final String sessionId;

  AccountDetailsRequestModel({
    required this.sessionId,
  });

  Map<String, dynamic> toJson() => {
        'session_id': sessionId,
      };
}
