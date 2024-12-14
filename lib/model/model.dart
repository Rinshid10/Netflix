class NetflixModel {
  String? backdrop_path;
  int? id;
  String? title;
  String? original_title;
  String? overview;
  String? poster_path;
  String? media_type;
  bool? adult;
  String? original_language;
  double? popularity;
  String? release_date;
  bool? video;
  double? vote_average;
  int? vote_count;

  NetflixModel({
    required this.backdrop_path,
    required this.id,
    required this.title,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.media_type,
    required this.adult,
    required this.popularity,
    required this.release_date,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory NetflixModel.fromJson(Map<String, dynamic> json) {
    return NetflixModel(
      backdrop_path: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      media_type: json['media_type'],
      adult: json['adult'],
      popularity: json['popularity']?.toDouble(),
      release_date: json['release_date'],
      video: json['video'],
      vote_average: json['vote_average']?.toDouble(),
      vote_count: json['vote_count'],
    );
  }
}
