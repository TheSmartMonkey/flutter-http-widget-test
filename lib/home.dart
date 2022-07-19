import 'package:flutter/material.dart';
import 'package:fluttertest/json_placeholder_service.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final JsonPlaceholderService client;

  const MyHomePage({
    Key? key,
    required this.title,
    required this.client,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';

  Future<void> _onPressed() async {
    final response = await widget.client.getPlaceholder();
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
