import 'package:flutter/material.dart';
import 'models/film.dart';

final List<Film> films = [
  Film(
      "Ford v Ferrari",
      5.5,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://m.media-amazon.com/images/M/MV5BM2UwMDVmMDItM2I2Yi00NGZmLTk4ZTUtY2JjNTQ3OGQ5ZjM2XkEyXkFqcGdeQXVyMTA1OTYzOTUx._V1_.jpg"),
  Film(
      "Tom & Jerry",
      8,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2021-01/tom_-_jerry.jpg"),
  Film(
      "Doraemon",
      7.6,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2022-05/still_4.jpg"),
  Film(
      "Ford v Ferrari",
      5.5,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://m.media-amazon.com/images/M/MV5BM2UwMDVmMDItM2I2Yi00NGZmLTk4ZTUtY2JjNTQ3OGQ5ZjM2XkEyXkFqcGdeQXVyMTA1OTYzOTUx._V1_.jpg"),
  Film(
      "Tom & Jerry",
      8,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2021-01/tom_-_jerry.jpg"),
  Film(
      "Doraemon",
      7.6,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2022-05/still_4.jpg"),
  Film(
      "Doraemon",
      7.6,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2022-05/still_4.jpg"),
  Film(
      "Doraemon",
      7.6,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2022-05/still_4.jpg"),
  Film(
      "Doraemon",
      7.6,
      ["Xuan Tuan", "Mario Orawa", "Tommy", "Alex"],
      "This film is very good, it will make you laugh",
      "https://media.vov.vn/sites/default/files/styles/large/public/2022-05/still_4.jpg"),

];
final List types = [
  "Action",
  "Crime",
  "Comedy",
  "Drama",
  "Horror",
];

final List<Tab> myTabs=  [
  const Tab(text: 'Pages',),
  const Tab(text: 'Popular',),
  const Tab(text: 'Now Playing',),
  const Tab(text: 'Favourites',),
];