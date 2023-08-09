import 'package:flutter/material.dart';

import '../../../models/movie.dart';

class TitleInDetail extends StatelessWidget {
  final Movie movie;

  const TitleInDetail({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topRight,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: width,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  '${movie.title}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
               Container(
                 alignment: Alignment.centerLeft,
                 child: Container(
                   width: width*0.7,
                   height: height * 0.05,
                   alignment: Alignment.centerLeft,
                   child:  Row(
                     children: [
                       Expanded(child: Text('${movie.releaseDate}')),
                       const Expanded(child: Text('2h 55min')),
                     ],
                   ),
                 ),

              ),

               Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: height * 0.08,
                  width: width*0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: OutlinedButton(
                          onPressed: null,
                          child: Text(
                            'Action',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: OutlinedButton(
                          onPressed: null,
                          child: Text(
                            'Biography',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: OutlinedButton(
                          onPressed: null,
                          child: Text(
                            'Dramar',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: OutlinedButton(
                          onPressed: null,
                          child: Text(
                            'Dramar',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            print('Add');
          },
          backgroundColor: Colors.pink[300],
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}