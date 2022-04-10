class WatchedMoviesRequestModel {
  WatchedMoviesRequestModel({
    required this.sessionId,
    required this.accountId,
    required this.page,
  });

  final String sessionId;
  final String accountId;
  final int page;

  Map<String, dynamic> toJson() => {
        'session_id': sessionId,
        'account_id': accountId,
        'page': page,
      };
}
