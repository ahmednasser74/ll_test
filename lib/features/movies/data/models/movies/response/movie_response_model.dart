import 'movie_item_model.dart';

class MovieResponseModel {
  MovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieItemModel> results;
  final int totalPages;
  final int totalResults;

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json["page"],
        results: List<MovieItemModel>.from(
          json["results"].map((x) => MovieItemModel.fromJson(x)),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
