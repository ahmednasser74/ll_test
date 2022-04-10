import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ll_test/core/utils/pref_util.dart';
import 'package:ll_test/features/movies/data/models/movies/response/movie_item_model.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key? key,
    required this.movie,
    this.isMovieList = true,
    this.onTapAddMovie,
  }) : super(key: key);
  final MovieItemModel movie;
  final bool isMovieList;
  final VoidCallback? onTapAddMovie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey)],
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w500/' + movie.posterPath,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              height: 50.h,
              child: Column(
                children: [
                  Text(movie.title),
                  SizedBox(height: 4.h),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontSize: 8.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isMovieList && SharedPrefs.instance.getIsUserLogin(),
          child: GestureDetector(
            onTap: onTapAddMovie,
            child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 14.r,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
