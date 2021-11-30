import '../../domain/entities/character.dart';
import 'info.dart';

class CharacterResponse {
  CharacterResponse({
    this.info,
    this.characters,
  });

  Info? info;
  List<Character>? characters;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        info: Info.fromJson(json["info"]),
        characters: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
      );

  get results => null;

  Map<String, dynamic> toJson() => {
        "info": info!.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
