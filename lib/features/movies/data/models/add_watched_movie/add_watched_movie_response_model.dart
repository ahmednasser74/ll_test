class AddWatchedMovieResponseModel {
  AddWatchedMovieResponseModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  final bool success;
  final int statusCode;
  final String statusMessage;

  factory AddWatchedMovieResponseModel.fromJson(Map<String, dynamic> json) =>
      AddWatchedMovieResponseModel(
        success: json["success"],
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
      );
}
