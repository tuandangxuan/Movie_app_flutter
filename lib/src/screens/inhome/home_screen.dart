import 'package:flutter/material.dart';
import 'package:movie_app/src/screens/drawer_navigation.dart';
import 'package:movie_app/src/screens/favourite/favourite_sceen.dart';
import 'package:movie_app/src/screens/inhome/intheater_screen.dart';
import 'package:movie_app/src/screens/inhome/popular_screen.dart';

import '../../utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final film = films[1];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  print('Search');
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=> const FeatureScreen()));
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.black26,
            indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(
                width: 4,
                color: Colors.pink,
              ),
              insets: const EdgeInsets.only(left: 10.0, right: 30.0),
              borderRadius: BorderRadius.circular(20),
            ),
            labelStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                ),
            labelColor: Colors.black87,
            isScrollable: true,
            tabs: myTabs,
          ),
        ),
        drawer: const DrawerNavigation(),
        body: const TabBarView(
          children: [
            InTheater(),
            PopularScreen(),
            PopularScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
    );
  }
}
