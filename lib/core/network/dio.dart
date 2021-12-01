import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../data/models/base_model.dart';
import '../constants/endpoints.dart';
import '../enums/exception_type.dart';
import '../enums/request_type.dart';
import '../failures/application_exception.dart';
import '../failures/failures.dart';

class DioClient {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio dio = Dio(baseOptions);

  Future<Either<Failure, T>> httpRequest<T extends BaseModel>(
      {required String path, required RequestMethod method, required T model, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.request(
        path,
        options: Options(method: method.requestMethodValue),
        queryParameters: queryParameters,
      );

      final data = _dataHandler(response, model);
      return Right(data);
    } catch (e) {
      ApplicationException exception = handleException(e);
      return Left(HttpError(exception.toString()));
    }
  }

  _dataHandler<T extends BaseModel>(Response response, T model) {
    if (response.data is List) {
      return response.data.map((e) => model.fromJson(e)).toList().cast<T>();
    } else if (response.data is Map) {
      return model.fromJson(response.data.cast<String, dynamic>());
    } else {
      return response.data;
    }
  }

  static ApplicationException handleException(error) {
    if (error is Exception) {
      try {
        ApplicationException exception = ApplicationException(ExceptionType.unknownError);
        if (error is DioError) {
          // GeneralUses.logCrashlyticsError(error: error, reason: error.message);
          switch (error.type) {
            case DioErrorType.cancel:
              exception = ApplicationException(ExceptionType.requestCancelled);
              break;
            case DioErrorType.connectTimeout:
              exception = ApplicationException(ExceptionType.requestTimeout);
              break;
            case DioErrorType.receiveTimeout:
              exception = ApplicationException(ExceptionType.timeout);
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  exception = ApplicationException(ExceptionType.badRequest);
                  break;
                case 401:
                  exception = ApplicationException(ExceptionType.unauthorisedRequest);
                  break;
                case 403:
                  exception = ApplicationException(ExceptionType.unauthorisedRequest);
                  break;
                case 404:
                  exception = ApplicationException(ExceptionType.notFound);
                  break;
                case 408:
                  exception = ApplicationException(ExceptionType.requestTimeout);
                  break;
                case 500:
                  exception = ApplicationException(ExceptionType.internalServerError);
                  break;
                case 503:
                  exception = ApplicationException(ExceptionType.serviceUnavailable);
                  break;
                default:
                  exception = ApplicationException(ExceptionType.unknownError);
              }
              break;
            case DioErrorType.sendTimeout:
              exception = ApplicationException(ExceptionType.timeout);
              break;
            case DioErrorType.other:
              if (error.toString().contains('SocketException')) {
                exception = ApplicationException(ExceptionType.noInternetConnection);
                break;
              } else {
                exception = ApplicationException(ExceptionType.unknownError);
                break;
              }
          }
        } else if (error is SocketException) {
          exception = ApplicationException(ExceptionType.noInternetConnection);
        } else {
          exception = ApplicationException(ExceptionType.unknownError);
        }
        return exception;
      } on FormatException catch (_) {
        return ApplicationException(ExceptionType.formatException);
      } catch (_) {
        return ApplicationException(ExceptionType.unknownError);
      }
    } else {
      return ApplicationException(ExceptionType.unknownError);
    }
  }
}
