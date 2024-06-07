import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/services/httpService.dart';

import '../dto/home_item_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeItemResponse> items = [];

  void fillList() async {
    items = await getTasks();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Accueil'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(items[index].name),
                      subtitle: Text("deadline : ${items[index].deadline}"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${items[index].percentageDone}% d'effectuer"),
                        Text(
                            "${items[index].percentageTimeSpent}% du temps d'écoulé")
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
