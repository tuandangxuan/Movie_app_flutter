import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie.dart';

class SummaryInDetail extends StatelessWidget {
  final Movie movie;

  const SummaryInDetail({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Plot Summary',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Wrap(
            children: [
              Text(
                '${movie.overview}',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
