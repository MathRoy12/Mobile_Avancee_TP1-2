import 'package:cached_network_image/cached_network_image.dart';
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
        title: Text(S.of(context).home),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: FutureBuilder<List<HomeItemPhotoResponse>>(
          future: getTasks(),
          builder: (context, lst) {
            if (lst.hasData) {
              return buildListView(lst.data!);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNew,
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView buildListView(List<HomeItemPhotoResponse> items) {
    return ListView.builder(
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
                  buildImage(items, index),
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
        });
  }

  SizedBox buildImage(List<HomeItemPhotoResponse> items, int index) {
    return (items[index].photoId > 0)
        ? SizedBox(
            height: 200,
            width: 325,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: "http://10.0.2.2:8080/file/${items[index].photoId}",
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          )
        : const SizedBox();
  }
}
