import 'package:flutter/material.dart';
import 'package:movie_app/src/models/film.dart';
import 'package:movie_app/src/models/genres.dart';
import 'package:movie_app/src/models/movie.dart';

class ItemFilm extends StatelessWidget {
  final Movie movie;
  final double height;

  const ItemFilm({
    super.key,
    required this.movie,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height/3,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Container(
            width: height / 4,
            height: height / 3,
            decoration: BoxDecoration(
                image:  DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original${movie.posterPath}'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(36)),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '${movie.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,

              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${movie.voteAverage}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
