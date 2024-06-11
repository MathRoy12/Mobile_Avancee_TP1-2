import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/pages/home_page.dart';
import 'package:mobile_avancee_tp1_2/services/httpService.dart';
import 'package:mobile_avancee_tp1_2/widgets/custom_text_field.dart';

import '../dto/transfer.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  DateTime _deadline = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2100));
    if(picked != null && picked!= _deadline){
      _deadline = picked;
    }
    setState(() {});
  }

  void _submitForm() async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      AddTaskRequest req = AddTaskRequest();
      req.deadline = _deadline;
      req.name = _name;

      await addTask(req);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New Task'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                name: 'name',
                saving: (value) {
                  _name = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "La tache doit avoir un nom";
                  }
                  return null;
                },
              ),
            Text('DeadLine: ${_deadline.year}/${_deadline.month}/${_deadline.day}'),
              MaterialButton(
                onPressed: () => selectDate(context),
                color: Colors.blue,
                child: const Text(
                  "Select deadline",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        child: const Icon(Icons.save),
      ),
    );
  }
}
