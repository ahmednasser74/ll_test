class CreateSessionRequestModel {
  final String requestToken;

  CreateSessionRequestModel({
    required this.requestToken,
  });

  Map<String, dynamic> toJson() => {
        'request_token': requestToken,
      };
}
