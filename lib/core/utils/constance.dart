class AppConstans {
  static const String baseURl = 'https://api.themoviedb.org/3';
  static const String test =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=885f6f95b13b2cb34dcd7f31b87b9d4f';
  static const String test2 =
      'https://api.themoviedb.org/3/movie/popular?api_key=885f6f95b13b2cb34dcd7f31b87b9d4f';
  static const String test3 =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=885f6f95b13b2cb34dcd7f31b87b9d4f';
  static const String test4 =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=885f6f95b13b2cb34dcd7f31b87b9d4f';
  static const String nowPalaying = '{/movie/now_playing?api_key=}';
  static const String popularMovies =
      '{$baseURl/movie/now_playing?api_key=$apiKey}';
  static const String topRatedMovies =
      '{$baseURl/movie/popular?api_key=$apiKey}';
  static const String apiKey = '885f6f95b13b2cb34dcd7f31b87b9d4f';
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => '$baseImageUrl$path';
}
