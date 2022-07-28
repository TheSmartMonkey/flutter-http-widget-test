import 'package:flutter/material.dart';
import 'package:fluttertest/json_placeholder_service.dart';
import 'package:fluttertest/main.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _jsonPlaceholderService = getIt<JsonPlaceholderService>();
  String text = '';

  Future<void> _onPressed() async {
    final response = await _jsonPlaceholderService.getPlaceholder();
    setState(() {
      text = response.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Get text'),
              onPressed: () => _onPressed(),
            ),
            const SizedBox(height: 40),
            Text(text),
          ],
        ),
      ),
    );
  }
}
