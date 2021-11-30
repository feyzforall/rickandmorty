import 'package:dartz/dartz.dart';

import '../../core/constants/endpoints.dart';
import '../../core/enums/request_type.dart';
import '../../core/failures/failures.dart';
import '../../core/network/dio.dart';
import '../../data/models/base_model.dart';
import '../../data/models/character_model.dart';
import '../../data/models/character_response_model.dart';
import '../../data/repositories/character_repository.dart';

class CharacterRepository implements ICharacterRepository {
  final DioClient dioClient;

  CharacterRepository(this.dioClient);

  @override
  Future<Either<Failure, CharacterModel>> fetchSingleCharacter({required int id}) async {
    await _requestHandler(
      CharacterModel(),
      queryParameters: {"id": id},
    );
    throw HttpError('Error');
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> fetchMultipleCharacter({required List<int> ids}) async {
    // TODO : Düzenlenecek
    await _requestHandler(CharacterModel());
    throw HttpError('Error');
  }

  @override
  Future<Either<Failure, CharacterResponse>> fetchAllCharacters() async {
    await _requestHandler(CharacterResponse());
    throw HttpError('Error');
  }

  Future<dynamic> _requestHandler<T extends BaseModel>(T model, {Map<String, dynamic>? queryParameters}) async {
    final response = await dioClient.httpRequest(
      path: Endpoints.characters,
      method: RequestMethod.get,
      model: model,
      queryParameters: queryParameters,
    );
    response.fold((l) => HttpError(l.toString()), (r) => r);
  }
}
