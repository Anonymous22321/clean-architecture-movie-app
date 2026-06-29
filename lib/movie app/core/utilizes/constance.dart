/// Base URLs
const String baseUrl = 'https://api.themoviedb.org/3';
const String movieBaseURL = 'https://api.themoviedb.org/3/movie';
const String tvBaseURL = 'https://api.themoviedb.org/3/tv';
const String searchBaseURL = 'https://api.themoviedb.org/3/search';
const String imageBaseURL = 'https://image.tmdb.org/t/p/original';


///API key
const String apiKey = '79d17a0e2f620cae245929c0da17caf0';

/// Response Keys
const String results = 'results';
const String id = 'id';
const String title = 'title';
const String overview = 'overview';
const String backdropPath = 'backdrop_path';
const String posterPath = 'poster_path';
const String voteAverage = 'vote_average';
const String releaseDate = 'release_date';
const String firstAirDate = 'first_air_date';
const String genreIds = 'genre_ids';
const String genres = 'genres';
const String name = 'name';
const String runtime = 'runtime';
const String episodeRuntime = 'episode_run_time';

/// General Methods
 String imageUrl(String path) => '$imageBaseURL$path';

/// Endpoints
class SearchEndPoints {
  static const String movie = '/movie';
  static const String tv = '/tv';
}
class MovieEndPoints {
  static const String nowPlaying = '/now_playing';
  static const String topRated = '/top_rated';
  static const String popular = '/popular';
  static const String upComing = '/upcoming';
  static const String recommendations = '/recommendations';
}
class TvEndPoints{
  static const String onTheAir = '/on_the_air';
  static const String topRated = '/top_rated';
  static const String popular = '/popular';

}
