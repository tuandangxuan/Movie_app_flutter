import 'package:flutter/material.dart';
import 'package:movie_app/src/network/network_request.dart';

import '../../../models/movie.dart';

class MovieInFeature extends StatefulWidget {
  final Movie movie;
  final bool favourite;

  const MovieInFeature(
      {super.key, required this.movie, required this.favourite});

  @override
  State<MovieInFeature> createState() => _MovieInFeatureState();
}

class _MovieInFeatureState extends State<MovieInFeature> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int vote = widget.movie.voteAverage!.round();
    String vote2= widget.movie.voteAverage!.toStringAsFixed(1);

    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: height / 4,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Column(
            children: [
              const Spacer(),
              Container(
                height: height / 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: height / 5.5),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, height / 30, 10, 10),
                        width: height / 3.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.movie.title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Tommy anderwerel',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 20,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: vote,
                                        itemBuilder: (context, index) {
                                          return const Icon(
                                            Icons.star_rounded,
                                            color: Colors.deepOrange,
                                            size: 15,
                                          );
                                        }),
                                  ),
                                  Text(
                                    vote2,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.none,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.favourite
                          ? const Text('')
                          : Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  addToFavorites(widget.movie.id);
                                  print('like');
                                },
                                icon: const Icon(
                                  Icons.favorite_sharp,
                                  size: 30,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: height / 5.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original${widget.movie.posterPath}'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(12),
            ),
          )
        ],
      ),
    );
  }
}
