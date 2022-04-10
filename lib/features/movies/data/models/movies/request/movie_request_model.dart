class MovieRequestModel {
  MovieRequestModel({required this.page});

  final int page;

  Map<String, dynamic> toJson() => {
        'page': page,
      };
}
