import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';
import 'package:mobile_avancee_tp1_2/widgets/my_drawer.dart';

import '../dto/transfer.dart';
import '../generated/l10n.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TaskDetailResponse res = TaskDetailResponse();

  int percentageDone = 0;

  @override
  void initState() {
    super.initState();

    loadDetail();
  }

  void loadDetail() async {
    res = await getTaskDetail(widget.id);
    percentageDone = res.percentageDone;
    setState(() {});
  }

  void save() async {
    await saveProgress(widget.id, percentageDone);

    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).detail),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                res.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                  "${S.of(context).deadline}: ${DateFormat(S.current.dateFormat).format(res.deadline)} (${res.percentageTimeSpent}%)"),
              const SizedBox(height: 20),
              Text(S.of(context).percentageDoneDetail),
              Slider(
                  value: percentageDone.toDouble(),
                  max: 100,
                  divisions: 100,
                  label: '$percentageDone',
                  onChanged: (value) {
                    percentageDone = value.round();
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.save),
      ),
    );
  }
}
