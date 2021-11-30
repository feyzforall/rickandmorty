import 'package:dartz/dartz.dart';

import '../../core/failures/failures.dart';
import '../models/character_model.dart';
import '../models/character_response_model.dart';

abstract class ICharacterRepository {
  Future<Either<Failure, CharacterResponse>> fetchAllCharacters();
  Future<Either<Failure, CharacterModel>> fetchSingleCharacter({required int id});
  Future<Either<Failure, List<CharacterModel>>> fetchMultipleCharacter({required List<int> ids});
}
