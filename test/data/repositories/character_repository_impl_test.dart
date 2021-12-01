import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/core/failures/failures.dart';
import 'package:rickandmorty/core/network/dio.dart';
import 'package:rickandmorty/data/models/character_model.dart';
import 'package:rickandmorty/data/models/character_response_model.dart';
import 'package:rickandmorty/data/repositories/character_repository_impl.dart';

void main() {
  DioClient dioClient = DioClient();
  CharacterRepository characterRepository = CharacterRepository(dioClient);

  test("fetch single rick and morty character", () async {
    const int id = 1;
    final response = await characterRepository.fetchSingleCharacter(id: id);

    expect(response is Right<Failure, CharacterModel>, true);
  });

  test("fetch multiple characters", () async {
    const List<int> ids = <int>[1, 2, 3];
    final response = await characterRepository.fetchMultipleCharacter(ids: ids);

    expect(response is Right<Failure, CharacterResponse>, true);
  });

  test("fetch all rick and morty characters(including MR. POOPYBUTTHOLE)", () async {
    final response = await characterRepository.fetchAllCharacters();

    expect(response is Right<Failure, CharacterResponse>, true);
  });
}
