class MovieItemModel {
  MovieItemModel({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  final int id;
  final String title;
  final String overview;
  final String posterPath;

  factory MovieItemModel.fromJson(Map<String, dynamic> json) => MovieItemModel(
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
      );
}
