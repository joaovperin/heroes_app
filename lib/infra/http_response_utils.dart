import 'package:http/http.dart';

extension FuckingResponse on Response {
  bool isSuccessful() => statusCode >= 200 && statusCode < 300;
  bool isNotFound() => statusCode == 404;
  bool isUnauthorized() => statusCode == 401;
  bool isClientError() => statusCode >= 400 && statusCode < 500;
  bool isServerError() => statusCode >= 500 && statusCode < 600;
}
