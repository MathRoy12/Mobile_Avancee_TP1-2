import 'package:dio/dio.dart';
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

  bool isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      isLoading = true;
      setState(() {});

      SigninRequest req = SigninRequest();
      req.password = _password;
      req.username = _name;
      try {
        await signin(req);
        navigateToHome();
      } on DioException catch (e) {
        if (e.response?.data == "InternalAuthenticationServiceException") {
          showSnackBar(
              S.current.badCredentials);
        } else {
          showSnackBar(S.current.globalError);
        }
        isLoading = false;
        setState(() {});
      }
    }
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
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
        title: Text(S.of(context).connection),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: buildForm(context),
      ),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildFormField(context),
          isLoading ? const LinearProgressIndicator() : const SizedBox(),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: !isLoading ? _submitForm : null,
            color: Colors.blue,
            child: Text(
              S.of(context).connection,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            onPressed: !isLoading ? navigateInscription : null,
            color: Colors.blue,
            child: Text(
              S.of(context).inscription,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Column buildFormField(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
