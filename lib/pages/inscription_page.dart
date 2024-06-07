import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/connection_page.dart';

import '../widgets/custom_text_form.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = ''; // Variable to store the entered name
  String _password = '';
  String _confirmPassword = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Name: $_name');
      print('Password: $_password');
      print('Confirm password: $_confirmPassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Inscription"),
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
              CustomTextForm(
                name: 'Confirm password',
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez confirmé votre mot de passe";
                  }
                  return null;
                },
                saving: (value) {
                  _confirmPassword = value!;
                },
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: _submitForm,
                color: Colors.blue,
                child: const Text(
                  'Inscription',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConnectionPage()));
                },
                color: Colors.blue,
                child: const Text(
                  'Connection',
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
