
import 'package:json_annotation/json_annotation.dart';

part 'account_get_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AccountGetInfo {
  Avatar avatar;
  int id;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  String name;
  bool includeAdult;
  String username;

  AccountGetInfo(
      {
      required  this.avatar,
      required  this.id,
      required  this.iso6391,
      required  this.iso31661,
      required  this.name,
      required  this.includeAdult,
      required  this.username});

  factory AccountGetInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountGetInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountGetInfoToJson(this);


}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Avatar {
  Gravatar gravatar;

  Avatar({
  required  this.gravatar});
  factory Avatar.fromJson(Map<String, dynamic> json) =>
      _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Gravatar {
  String hash;

  Gravatar({
    required  this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);

  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}