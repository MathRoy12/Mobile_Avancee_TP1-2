import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_avancee_tp1_2/pages/creation_page.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';
import 'package:mobile_avancee_tp1_2/widgets/my_drawer.dart';

import '../dto/transfer.dart';
import '../generated/l10n.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeItemPhotoResponse> items = [];

  void fillList() async {
    items = await getTasks();
    setState(() {});
  }

  void createNew() {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreationPage()))
        .then((value) => fillList());
  }

  detail(int id) {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(id: id)))
        .then((value) => fillList());
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
        title: Text(S.of(context).home),
      ),
      drawer: const MyDrawer(),
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
                        subtitle: Text(
                            "${S.of(context).deadline} : ${DateFormat(S.current.dateFormat).format(items[index].deadline)}"),
                      ),
                      (items[index].photoId > 0)
                          ? Image.network(
                              "http://10.0.2.2:8080/file/${items[index].photoId}")
                          : const SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(S
                              .of(context)
                              .percentageDoneHome(items[index].percentageDone)),
                          Text(S
                              .of(context)
                              .timeElapsed(items[index].percentageTimeSpent))
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
