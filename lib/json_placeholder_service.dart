import 'dart:convert';

import 'package:fluttertest/json_placeholder_model.dart';
import 'package:http/http.dart' as http;

class JsonPlaceholderService {
  Future<JsonPlaceholderModel> getPlaceholder() async {
    const url = 'https://jsonplaceholder.typicode.com/todos/1';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    final JsonPlaceholderModel json = JsonPlaceholderModel.fromJson(data);
    return json;
  }

  Future<void> sleep() async {
    Future<void>.delayed(const Duration(hours: 8));
  }
}
