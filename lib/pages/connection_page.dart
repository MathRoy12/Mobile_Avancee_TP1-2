import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/inscription_page.dart';

import '../widgets/custom_text_form.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Name: $_name');
      print('Password: $_password');
    }
  }

  navigateInscription() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const InscriptionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Connection"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextForm(
                name: 'Username',
                isPassword: false,
                validator: (value) {
                  if (_name.isEmpty) {
                    return "Vous devez entrez un nom d'utilisateur";
                  }
                  return null;
                },
                saving: (value) {
                  _name = value!;
                },
              ),
              CustomTextForm(
                name: 'Password',
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez écrire votre mot de passe";
                  }
                  return null;
                },
                saving: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: _submitForm,
                color: Colors.blue,
                child: const Text(
                  'Connexion',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: navigateInscription,
                color: Colors.blue,
                child: const Text(
                  'Inscription',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
