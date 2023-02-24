import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiException implements Exception {
  String? message;
  var logger = Logger();

  ApiException({this.message});

  ApiException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioErrorType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioErrorType.unknown:
        message = 'Connection to API server failed due to internet connection';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Received timeout in connection with API server';
        break;
      case DioErrorType.badResponse:
        message =
            _handeError(dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }

  String _handeError(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthenticated! Please logout and login again';
      case 403:
        return 'Unauthorized!';
      case 404:
        return 'The requested resources was not found';
      case 422:
        try {
          var errorMessages = <String>[];

          Map<String, dynamic> map =
              Map<String, dynamic>.from(data['errors'] as Map);
          map.forEach((mapKey, value) {
            errorMessages.add(map[mapKey][0] as String);
          });

          return errorMessages.join('\n');
        } catch (e) {
          // logger.e(e);
        }

        // check if message is set
        try {
          return data['message'].toString();
        } catch (e) {
          // logger.e(e);
        }

        return 'Internal Server Error';
      case 500:
        return 'Internal Server Error';
      default:
        return 'Internal Server Error';
    }
  }

  @override
  String toString() => message.toString();
}
