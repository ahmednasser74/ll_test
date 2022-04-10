class AddWatchedMoviesRequestModel {
  AddWatchedMoviesRequestModel({
    required this.mediaType,
    required this.mediaId,
    required this.watchList,
    required this.sessionId,
    required this.accountId,
  });

  final String mediaType;
  final int mediaId;
  final bool watchList;
  final String sessionId;
  final String accountId;

  Map<String, dynamic> toJson() => {
        'media_type': mediaType,
        'media_id': mediaId,
        'watchlist': watchList,
      };
}
