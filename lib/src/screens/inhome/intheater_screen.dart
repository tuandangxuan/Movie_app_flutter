import 'package:flutter/material.dart';
import 'package:movie_app/src/network/network_request.dart';

import '../detail/detail_screen.dart';
import 'item_film_screen.dart';

class InTheater extends StatefulWidget {
  const InTheater({super.key});

  @override
  State<InTheater> createState() => _InTheaterState();
}

class _InTheaterState extends State<InTheater> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            child: FutureBuilder(
                future: fetchGenres(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: OutlinedButton(
                            child: Text(
                              '${snapshot.data![index].name}',
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              print('Action');
                            },
                          ),
                        );
                      })
                      : const Text('false');
                }),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder(
                future: fetchMovies(),
                builder: (context, snapshot) {
                  return snapshot.hasData? ListView.builder(
                    scrollDirection: Axis.horizontal,
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
                        child: ItemFilm(
                          movie: snapshot.data![index],
                          height: height,
                        ),
                      );
                    },
                  ): const Center(
                    child: Text('no data from api'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
