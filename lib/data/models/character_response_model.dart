import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/character.dart';
import 'base_model.dart';
import 'info.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponse extends BaseModel {
  CharacterResponse({
    this.info,
    this.characters,
  });

  Info? info;
  List<Character>? characters;

  @override
  fromJson(Map<String, dynamic> json) => _$CharacterResponseFromJson(json);

  @override
  Map toJson() => _$CharacterResponseToJson(this);
}
