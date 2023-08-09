import 'package:flutter/material.dart';
import 'package:movie_app/src/screens/feature/widgets/movie_in_feature.dart';
import '../../network/network_request.dart';
import '../detail/detail_screen.dart';
import 'widgets/top_in_feature.dart';

class FeatureScreen extends StatefulWidget {

  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.grey[200],
      width: double.infinity,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children:  [
            const TopInFeature(),

            Expanded(
              child: FutureBuilder(
                future: fetchMovies(),
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
                          favourite: false,

                        ),
                      );
                    },
                  ): const Center(
                    child: Text(''),
                  );
                },
              ),
            ),
          ],

        )
      ),
    );
  }
}
