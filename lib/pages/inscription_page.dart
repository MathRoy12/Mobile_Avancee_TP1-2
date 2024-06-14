import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/connection_page.dart';
import 'package:mobile_avancee_tp1_2/pages/home_page.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';

import '../dto/transfer.dart';
import '../generated/l10n.dart';
import '../widgets/custom_text_field.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _password = '';
  String _confirmPassword = '';

  bool btnIsEnable = true;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      btnIsEnable = false;
      setState(() {});

      SignupRequest req = SignupRequest();
      req.password = _password;
      req.username = _name;
      try {
        await signup(req);
        navigateToHome();
      } catch (e) {
        btnIsEnable = true;
        showSnackBar();
        setState(() {});
      }
    }
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(S.current.globalError)));
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void navigateToConnection() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ConnectionPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).inscription),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                name: S.of(context).username,
                validator: (value) {
                  if (_name.isEmpty) {
                    return S.of(context).usernameValidation;
                  }
                  return null;
                },
                saving: (value) {
                  _name = value!;
                },
              ),
              CustomTextField(
                name: S.of(context).password,
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
              CustomTextField(
                name: S.of(context).confirmPassword,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).confirmPasswordValidation;
                  } else if (value != _password) {
                    return S.of(context).samePasswordValidation;
                  }
                  return null;
                },
                saving: (value) {
                  _confirmPassword = value!;
                },
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: btnIsEnable ? _submitForm : null,
                color: Colors.blue,
                child: Text(
                  S.of(context).inscription,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: btnIsEnable ? navigateToConnection : null,
                color: Colors.blue,
                child: Text(
                  S.of(context).connection,
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
