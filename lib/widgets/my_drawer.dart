import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/connection_page.dart';
import 'package:mobile_avancee_tp1_2/pages/home_page.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';
import 'package:mobile_avancee_tp1_2/services/username_service.dart';

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
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CreationPage()))
        .then((value) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  void goHome() {
    Navigator.popUntil(context, (route) => route.isFirst);
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
            title: const Text("Home"),
            onTap: goHome,
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("New Task"),
            onTap: createNew,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log out"),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
