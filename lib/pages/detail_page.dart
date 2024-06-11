import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/services/httpService.dart';

import '../dto/transfer.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  TaskDetailResponse res = TaskDetailResponse();

  @override
  void initState(){
    super.initState();

    getTaskDetail(widget.id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail'),
      ),
      body: Column(
        children: [
          Text("dskfjh")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}
