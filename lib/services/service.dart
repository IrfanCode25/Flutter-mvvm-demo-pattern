import 'dart:convert';

import 'package:flutter_mvvm_demo/model/picsum_model.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<PicsumModel>> fetchPictureAPI() async {
    String url = "https://picsum.photos/v2/list";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      final listResult = json.map((e) => PicsumModel.fromJson(e)).toList();
      return listResult;
    } else {
      throw Exception('Error Fetching pictures');
    }
  }
}
