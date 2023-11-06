import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  const ErrorApp({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
