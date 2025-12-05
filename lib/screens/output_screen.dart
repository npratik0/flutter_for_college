import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'output screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
