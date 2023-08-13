import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/src/models/movie.dart';
import '../models/genres.dart';

List<Genre> parseGenre(String responseBody) {
  var list = json.decode(responseBody)['genres'] as List<dynamic>;
  List<Genre> genres = list.map((e) => Genre.fromJson(e)).toList();
  return genres;
}

// lỗi
Future<List<Genre>> fetchGenres() async {
  Uri url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=50feed84a71e4140f11bc5798e5b83aa');

  try {
    var response = await http.get(url);

    print('TuanNX fetchGenres  ${response.statusCode} ');
    if (response.statusCode == 200) {
      return parseGenre(response.body);
    } else {
      throw Exception('Request failed');
    }
  } on Exception {
    rethrow;
  }
}

//

Future<List<Movie>> fetchMovies() async {
  const apiKey = '50feed84a71e4140f11bc5798e5b83aa';
  const url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];
      final List<Movie> movies =
      results.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      print('Failed to fetch movies. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

//https://api.themoviedb.org/3/movie/now_playing

Future<List<Movie>> fetchMoviesPopular() async {
  const apiKey = '50feed84a71e4140f11bc5798e5b83aa';
  const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];
      final List<Movie> movies =
      results.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      print('Failed to fetch movies. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

// add favorite
Future<void> addToFavorites(int? idMovie) async {

  final url = Uri.parse('https://api.themoviedb.org/3/account/20253941/favorite');
  final rawBody = '{"media_type":"movie","media_id":$idMovie,"favorite":true}';

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'Authorization' :'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGZlZWQ4NGE3MWU0MTQwZjExYmM1Nzk4ZTViODNhYSIsInN1YiI6IjY0Y2M3ZjllNzY0Yjk5MDBjNjM4MmNhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PKQvqWusmk0m3vTo21FZk7U0jttCzYPS0e3auWjKMGQ'
      // Thêm các header khác nếu cần thiết, ví dụ như Authorization header
    },
    body: rawBody,
  );

  final statusCode = response.statusCode;
  final responseData = jsonDecode(response.body);

  if (statusCode == 201) {
    // Yêu cầu được tạo thành công
    print('Phim (id : $idMovie đã được thêm vào danh sách yêu thích');
    // Hiển thị thông báo thành công cho người dùng hoặc xử lý tiếp theo tùy ý
  } else {
    // Xử lý lỗi nếu có
    final errorMessage = responseData['status_message'];
    print('Lỗi $statusCode: $errorMessage');
    // Hiển thị thông báo lỗi cho người dùng hoặc xử lý tiếp theo tùy ý
  }
}

//list favourite

Future<List<Movie>> fetchMoviesFavourite() async {
  const url = 'https://api.themoviedb.org/3/account/20253941/favorite/movies?language=en-US&page=1&sort_by=created_at.asc';

  try {
    final response = await http.get(Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'Authorization' :'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGZlZWQ4NGE3MWU0MTQwZjExYmM1Nzk4ZTViODNhYSIsInN1YiI6IjY0Y2M3ZjllNzY0Yjk5MDBjNjM4MmNhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PKQvqWusmk0m3vTo21FZk7U0jttCzYPS0e3auWjKMGQ'
      });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];
      final List<Movie> movies =
      results.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      print('Failed to fetch movies. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}