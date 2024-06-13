import 'package:flutter/material.dart';
import 'package:mobile_avancee_tp1_2/services/http_service.dart';
import 'package:mobile_avancee_tp1_2/widgets/custom_text_field.dart';
import 'package:mobile_avancee_tp1_2/widgets/my_drawer.dart';

import '../dto/transfer.dart';
import '../generated/l10n.dart';

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

      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).newTask),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                name: S.of(context).name,
                saving: (value) {
                  _name = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).nameValidation;
                  }
                  return null;
                },
              ),
            Text('${S.of(context).deadline} ${_deadline.year}/${_deadline.month}/${_deadline.day}'),
              MaterialButton(
                onPressed: () => selectDate(context),
                color: Colors.blue,
                child: Text(
                  S.of(context).selectDeadline,
                  style: const TextStyle(color: Colors.white),
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
