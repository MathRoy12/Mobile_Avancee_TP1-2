import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/creation_page.dart';
import 'package:mobile_avancee_tp1_2/services/httpService.dart';

import '../dto/transfer.dart';
import 'detail_page.dart';

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

  void createNew() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CreationPage()));
  }

  detail(int id) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(id: id)));
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
              return MaterialButton(
                onPressed: () {
                  detail(items[index].id);
                },
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(items[index].name),
                        subtitle: Text("Deadline : ${items[index].deadline}"),
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
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNew,
        child: const Icon(Icons.add),
      ),
    );
  }
}
