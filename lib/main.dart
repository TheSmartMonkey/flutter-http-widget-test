import 'package:flutter/material.dart';
import 'package:fluttertest/home.dart';
import 'package:fluttertest/json_placeholder_service.dart';

void main() {
  runApp(MyApp(client: JsonPlaceholderService()));
}

class MyApp extends StatelessWidget {
  final JsonPlaceholderService client;

  const MyApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        client: client,
      ),
    );
  }
}
