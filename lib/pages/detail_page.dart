import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
