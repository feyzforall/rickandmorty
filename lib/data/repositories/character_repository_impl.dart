import 'package:dartz/dartz.dart';

import '../../core/constants/endpoints.dart';
import '../../core/enums/request_type.dart';
import '../../core/failures/failures.dart';
import '../../core/network/dio.dart';
import '../models/character_model.dart';
import '../models/character_response_model.dart';
import 'character_repository.dart';

class CharacterRepository implements ICharacterRepository {
  final DioClient dioClient;

  CharacterRepository(this.dioClient);

  @override
  Future<Either<Failure, CharacterModel>> fetchSingleCharacter({required int id}) async {
    final response = await dioClient.httpRequest(
      path: Endpoints.characters,
      method: RequestMethod.get,
      model: CharacterModel(),
      queryParameters: {"id": id},
    );
    return response.fold(
      (l) => Left(HttpError(l.toString())),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, CharacterResponse>> fetchMultipleCharacter({required List<int> ids}) async {
    final response = await dioClient.httpRequest(
      path: Endpoints.characters,
      method: RequestMethod.get,
      model: CharacterResponse(),
      queryParameters: {"id": ids},
    );
    return response.fold(
      (l) => Left(
        HttpError(l.toString()),
      ),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<Failure, CharacterResponse>> fetchAllCharacters() async {
    final response = await dioClient.httpRequest(
      path: Endpoints.characters,
      method: RequestMethod.get,
      model: CharacterResponse(),
      queryParameters: {"id": id},
    );
    return response.fold(
      (l) => Left(HttpError(l.toString())),
      (r) => Right(r),
    );
  }

  // Future<Either<Failure, T>> _requestHandler<T extends BaseModel>(T model, {Map<String, dynamic>? queryParameters}) async {
  //   final response = await dioClient.httpRequest(
  //     path: Endpoints.characters,
  //     method: RequestMethod.get,
  //     model: model,
  //     queryParameters: queryParameters,
  //   );
  //   return response.fold(
  //     (l) => Left(HttpError(l.toString())),
  //     (r) => Right(r),
  //   );
  // }
}
