
import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie.dart';
import 'package:movie_app/src/screens/detail/widgets/cast_in_detail.dart';
import 'package:movie_app/src/utils.dart';
import '../../models/film.dart';
import 'widgets/summary_in_detail.dart';
import 'widgets/top_in_detail.dart';
import 'widgets/title_in_detail.dart';



class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Film film = films[1];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            TopInDetail(movie: movie),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: ListView(
                  children: [
                    TitleInDetail(movie: movie),
                    SummaryInDetail(movie: movie),
                    const CastInDetail(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
