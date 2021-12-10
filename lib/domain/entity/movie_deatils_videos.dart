import 'package:json_annotation/json_annotation.dart';

part'movie_deatils_videos.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsVideos {
  List<MovieDetailsVideosResults> results;

  MovieDetailsVideos({
   required this.results});
  factory MovieDetailsVideos.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsVideosFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsVideosResults {
  String id;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String publishedAt;

  MovieDetailsVideosResults(
      {
      required  this.iso6391,
      required  this.iso31661,
      required  this.name,
      required  this.key,
      required  this.site,
      required  this.size,
      required  this.type,
      required  this.official,
      required  this.publishedAt,
      required  this.id});

  factory MovieDetailsVideosResults.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsVideosResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsVideosResultsToJson(this);

}
