import 'dart:typed_data';

import 'package:heroes_app/infra/http_response_utils.dart';
import 'package:http/http.dart' as http;

class ImagesRepository {
  static ImagesRepository? _instance;
  ImagesRepository._();
  factory ImagesRepository() => _instance ??= ImagesRepository._();

  Future<Uint8List> getImageByUrl(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.isSuccessful()) {
      return response.bodyBytes;
    }

    throw Exception('fail to get image data on $uri');
  }
}
