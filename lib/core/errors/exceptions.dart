import 'package:movie_app/core/network/error_message_model.dart';

class ServerExceptin implements Exception{
 final  ErrorMessageModel errorModel;

  ServerExceptin({required this.errorModel});
}