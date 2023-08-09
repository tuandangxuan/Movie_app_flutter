import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie.dart';

import '../../../models/film.dart';

class TopInDetail extends StatefulWidget {
  final Movie movie;
  const TopInDetail({super.key, required this.movie});

  @override
  State<TopInDetail> createState() => _TopInDetailState();
}

class _TopInDetailState extends State<TopInDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: height/3.5,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/original${widget.movie.posterPath}'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50))),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 25,
                    ))
              ],
            )),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          width: width/1.3,
          height: height/9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,0,0),
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                                children: [
                                  TextSpan(
                                      text: '${widget.movie.voteAverage}',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.blueGrey)),
                                  const TextSpan(
                                      text: ' /10',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.blueGrey)),
                                ])),
                         Text(
                          '${widget.movie.voteCount}',
                          style: const TextStyle(fontSize: 10, color: Colors.black26),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,0,0),
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.star_border_rounded,
                            size: 30,
                          ),
                          onTap: () {
                            print("Rate this");
                          },
                        ),
                        const Text(
                          'Rate this',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,5,0,0),
                  child: Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.score,
                            size: 30,
                            color: Colors.green,
                          ),
                          onTap: () {
                            print("Metascore");
                          },
                        ),
                        const Text(
                          'Metastore',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          'Very good',
                          style:
                          TextStyle(fontSize: 12, color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
