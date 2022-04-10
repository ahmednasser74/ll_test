class EndPoints {
  static const String login = 'authentication/token/validate_with_login';
  static const String createSession = 'authentication/session/new';
  static const String requestToken = 'authentication/token/new';
  static const String movies = 'movie/now_playing';

  static String accountDetails({required String sessionId}) =>
      'account?session_id=$sessionId';
}
