import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/alert/alert_popup.dart';
import 'package:movie_app/src/blocs/genre_bloc/genre_bloc.dart';
import 'package:movie_app/src/blocs/genre_bloc/genre_event.dart';
import 'package:movie_app/src/blocs/genre_bloc/genre_state.dart';
import 'package:movie_app/src/blocs/main_bloc.dart';
import 'package:movie_app/src/blocs/movie_bloc/movie_bloc.dart';
import 'package:movie_app/src/blocs/movie_bloc/movie_event.dart';
import 'package:movie_app/src/blocs/movie_bloc/movie_state.dart';
import 'package:movie_app/src/network/network_request.dart';

import '../../models/genres.dart';
import '../../models/movie.dart';
import '../detail/detail_screen.dart';
import 'item_film_screen.dart';

class InTheater extends StatefulWidget {
  const InTheater({super.key});

  @override
  State<InTheater> createState() => _InTheaterState();
}

class _InTheaterState extends State<InTheater> {
  List<Genre> _genres = [];
  List<Movie> _movies = [];
  bool _isLoadingGenre = false;
  bool _isLoadingMovie = false;

  _getGenres() async {
    BlocProvider.of<GenreBloc>(context).add(const RequestGetGenre());
  }

  _getMovies() async {
    BlocProvider.of<MovieBloc>(context).add(const RequestGetMovie());
  }

  @override
  void initState() {
    // TODO: implement initState
    _getGenres();
    _getMovies();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MultiBlocListener(
      listeners: [
        BlocListener<GenreBloc, GenreState>(listener: (context, state) {
          if (state is GenreLoading) {
            _isLoadingGenre = true;
          } else if (state is GenreLoaded) {
            _isLoadingGenre = false;
            _genres = state.genres;
          } else if (state is GenreLoadError) {
            _isLoadingGenre = false;
            AlertUtils.displayErrorAler(context, state.message);
          }
        }),
        BlocListener<MovieBloc, MovieState>(listener: (context, state) {
          if (state is MovieLoading) {
            _isLoadingMovie = true;
          } else if (state is MovieLoaded) {
            _isLoadingMovie = false;
            _movies = state.movies;
          } else if (state is MovieLoadError) {
            _isLoadingMovie = false;
            AlertUtils.displayErrorAler(context, state.message);
          }
        }),
      ],
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 30,
            ),
            SizedBox(height: 50, child: _buildGenres(context)),
            const SizedBox(height: 50),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildMovies(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenres(BuildContext context) {
    if (_isLoadingGenre) {
      return const Expanded(
          child: CupertinoActivityIndicator(
        animating: true,
      ));
    }
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _genres.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: OutlinedButton(
              child: Text(
                '${_genres[index].name}',
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                print('Action');
              },
            ),
          );
        });
  }

  Widget _buildMovies(BuildContext context) {
    if (_isLoadingMovie) {
      return const Expanded(
          child: CupertinoActivityIndicator(
        animating: true,
      ));
    }
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: GestureDetector(
              child: ItemFilm(movie: _movies[index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movie: _movies[index])));
              },
            ),
          );
        });
  }
}
