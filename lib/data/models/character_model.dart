import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/character.dart';
import 'base_model.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends BaseModel {
  CharacterModel({
    this.character,
  });

  Character? character;

  @override
  fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);

  @override
  Map toJson() => _$CharacterModelToJson(this);
}
