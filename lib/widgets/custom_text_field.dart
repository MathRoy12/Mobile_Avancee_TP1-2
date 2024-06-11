import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.name,
      this.isPassword = false,
      required this.validator,
      required this.saving});

  final String name;
  final bool isPassword;
  final String? Function(String?) validator;
  final Function(String?) saving;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  _CustomTextFieldState();

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
