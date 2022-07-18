import 'package:flutter/material.dart';
import 'package:fluttertest/json_placeholder_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';

  Future<void> _onPressed() async {
    // await JsonPlaceholderService().sleep();
    final response = await JsonPlaceholderService().getPlaceholder();
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
