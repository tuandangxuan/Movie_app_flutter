import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/blocs/main_bloc.dart';
import 'package:movie_app/src/screens/inhome/home_screen.dart';

void main() {
  runApp(const MyCoreApp());
}

class MyCoreApp extends StatelessWidget {
  const MyCoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MainBloc.allBlocs(),
        child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Home',),
    );
  }
}

