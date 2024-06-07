import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm(
      {super.key,
      required this.name,
      required this.isPassword,
      required this.validator,
      required this.saving});

  final String name;
  final bool isPassword;
  final String? Function(String?) validator;
  final Function(String?) saving;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  _CustomTextFormState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        obscureText: widget.isPassword,
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        decoration: InputDecoration(
            label: Text(widget.name), border: const OutlineInputBorder()),
        validator: widget.validator,
        onSaved: widget.saving,
        onChanged: widget.saving,
      ),
    );
  }
}
