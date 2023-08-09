import 'package:flutter/material.dart';
import 'package:movie_app/src/network/network_request.dart';

import '../detail/detail_screen.dart';
import '../feature/widgets/movie_in_feature.dart';
import '../feature/widgets/top_in_feature.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.grey[200],
      width: double.infinity,
      child:  Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Container(
            height: 500,
            width: double.infinity,
            child: FutureBuilder(
              future: fetchMoviesFavourite(),
              builder: (context, snapshot) {
                return snapshot.hasData? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  movie: snapshot.data![index],
                                )));
                      },
                      child: MovieInFeature(
                        movie: snapshot.data![index],
                        favourite: true,

                      ),
                    );
                  },
                ): const Center(
                  child: Text(''),
                );
              },
            ),
          )
      ),
    );
  }
}


