import 'package:flutter/material.dart';

class CardViewScreen extends StatelessWidget {
  const CardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'cardview',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
