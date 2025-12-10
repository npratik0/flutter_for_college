import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Layout'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 400,
              width: double.infinity,
              child: Image.network(
                'https://cdn.marvel.com/content/2x/002irm_com_cut_mob_01_2.jpg',
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.edit, color: Colors.blue),
            ),
            Positioned(
              bottom: 20,
              left: 50,
              child: Icon(Icons.thumb_up, color: Colors.blue),
            ),
            Positioned(
              bottom: 20,
              left: 80,
              child: Icon(Icons.comment, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
