import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        children: [
          for (int i = 1; i < 7; i++) ...{
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('$i', style: const TextStyle(fontSize: 50)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          },
        ],
      ),
    );
  }
}
