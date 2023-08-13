import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/alert/alert_popup.dart';
import 'package:movie_app/src/blocs/favourite_bloc/favourite_bloc.dart';
import 'package:movie_app/src/blocs/favourite_bloc/favourite_event.dart';
import 'package:movie_app/src/blocs/favourite_bloc/favourite_state.dart';
import 'package:movie_app/src/network/network_request.dart';

import '../../models/movie.dart';
import '../detail/detail_screen.dart';
import '../feature/widgets/movie_in_feature.dart';
import '../feature/widgets/top_in_feature.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Movie> _movies = [];
  bool _isLoading = false;

  _getFavourite() {
    BlocProvider.of<FavouriteBloc>(context).add(const RequestGetFavourite());
  }
  @override
  void initState() {
    // TODO: implement initState
    _getFavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<FavouriteBloc, FavouriteState>(
      builder: (context, state) => _buildFavorite(context),
      listener: (context, state) {
        if (state is FavouriteLoading) {
          _isLoading = true;
        } else if (state is FavouriteLoaded) {
          _isLoading = false;
          _movies = state.movies;
        } else if (state is FavouriteLoadError) {
          AlertUtils.displayErrorAler(context, state.message);
        }
      },
    );
  }

  Widget _buildFavorite(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (_isLoading) {
      return const Center(
          child: CupertinoActivityIndicator(
        animating: true,
        )
      );
    }
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.grey[200],
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        height: height*0.8,
        child: ListView.builder(
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: MovieInFeature(movie: _movies[index], favourite: true),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(movie: _movies[index])));
                },
              );
            }),
      ),
    );
  }
}
