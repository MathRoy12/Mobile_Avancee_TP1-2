import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/inscription_page.dart';

import '../dto/transfer.dart';
import '../generated/l10n.dart';
import '../services/http_service.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _password = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SigninRequest req = SigninRequest();
      req.password = _password;
      req.username = _name;
      try {
        SigninResponse res = await signin(req);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()));
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.current.globalError)));
        return;
      }
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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(S
            .of(context)
            .connection),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                name: S
                    .of(context)
                    .username,
                validator: (value) {
                  if (_name.isEmpty) {
                    return S
                        .of(context)
                        .usernameValidation;
                  }
                  return null;
                },
                saving: (value) {
                  _name = value!;
                },
              ),
              CustomTextField(
                name: S
                    .of(context)
                    .password,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).passwordValidation;
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
                child: Text(
                  S
                      .of(context)
                      .connection,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: navigateInscription,
                color: Colors.blue,
                child: Text(
                  S
                      .of(context)
                      .inscription,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
