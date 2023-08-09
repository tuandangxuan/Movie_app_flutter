
import 'package:flutter/material.dart';

class TopInFeature extends StatefulWidget {
  const TopInFeature({super.key});

  @override
  State<TopInFeature> createState() => _TopInFeatureState();
}

class _TopInFeatureState extends State<TopInFeature> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
        Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: const Text(
                'Feature',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
            ),
          ],
        );
  }
}
