import 'package:flutter/material.dart';
import 'package:movie_app/src/screens/feature/feature_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const FeatureScreen()));
              },
              child: Container(
                width: width / 3,
                height: width / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images2.thanhnien.vn/Uploaded/namnt/2022_11_28/photo-13-16692790376601245606701-7393.jpg"),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dang Xuan Tuan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  height: height / 5,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        'Age:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          child: Text(
                        'DOB:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                      Expanded(
                          child: Text(
                        'Account:',
                        style: TextStyle(
                            fontSize: 20, fontWeight:FontWeight.w500),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: height / 5,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                              '20',
                              style: TextStyle(
                                  fontSize: 20),
                            )),
                        Expanded(
                            child: Text(
                              '04/06/2003',
                              style: TextStyle(
                                  fontSize: 20),
                            )),
                        Expanded(
                            child: Text(
                              'tuandx',
                              style: TextStyle(
                                  fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
