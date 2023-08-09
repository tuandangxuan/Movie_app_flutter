import 'package:flutter/material.dart';

class CastInDetail extends StatefulWidget {
  const CastInDetail({super.key});

  @override
  State<CastInDetail> createState() => _CastInDetailState();
}

class _CastInDetailState extends State<CastInDetail> {
  final listCast = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cast & Crew',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(
          height: height / 3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCast.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: width / 5,
                  child: Column(
                    children: [
                      Container(
                        height: width/5.5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-i.vtcnews.vn/resize/th/upload/2021/07/27/096c941e264876dac957416107e8361a-10354856.jpg')),
                            shape: BoxShape.circle),
                      ),
                      const Text(
                        'DiCaprio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}

class CastInCast extends StatelessWidget {
  const CastInCast({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      width: width / 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: width / 5,
            height: width / 5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn-i.vtcnews.vn/resize/th/upload/2021/07/27/096c941e264876dac957416107e8361a-10354856.jpg')),
                shape: BoxShape.circle),
          ),
          Container(
              color: Colors.red,
              width: double.infinity,
              child: const Text('Leonardo DiCaprio vvvvvvvv')),
        ],
      ),
    );
  }
}
