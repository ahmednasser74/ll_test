class LoginRequestModel {
  final String userName;
  final String password;
  final String? requestToken;

  LoginRequestModel({
    required this.userName,
    required this.password,
    this.requestToken = '',
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'password': password,
        'request_token': requestToken,
      };
}
