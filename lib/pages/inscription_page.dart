import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/dto/signin_response.dart';
import 'package:mobile_avancee_tp1_2/dto/signup_request.dart';
import 'package:mobile_avancee_tp1_2/pages/connection_page.dart';
import 'package:mobile_avancee_tp1_2/pages/home_page.dart';
import 'package:mobile_avancee_tp1_2/services/httpService.dart';

import '../widgets/custom_text_field.dart';

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

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SignupRequest req = SignupRequest();
      req.password = _password;
      req.username = _name;
      try{
        SigninResponse res = await signup(req);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => const HomePage()));
      }
      catch(e){
        print(e);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Il y a eux une Erreur')));
      }
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
              CustomTextField(
                name: 'Username',
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
              CustomTextField(
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
              CustomTextField(
                name: 'Confirm password',
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Veuillez confirmé votre mot de passe";
                  }
                  else if(value != _password){
                    return "Votre confirmation n'est pas comme votre mot de passe";
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
