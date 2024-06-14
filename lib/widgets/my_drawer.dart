import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/connection_page.dart';
import 'package:mobile_avancee_tp1_2/pages/home_page.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';
import 'package:mobile_avancee_tp1_2/services/username_service.dart';

import '../generated/l10n.dart';
import '../pages/creation_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final UsernameService _usernameService = UsernameService();
  TextStyle buttonStyle = const TextStyle(fontSize: 20);

  void createNew() {
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CreationPage()));
  }

  void goHome() {
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void logout() {
    signout();
    Navigator.pop(context);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ConnectionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Center(
                  child: Text(
                _usernameService.username,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ))),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(S.of(context).home),
            onTap: goHome,
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text(S.of(context).newTask),
            onTap: createNew,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(S.of(context).logout),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
