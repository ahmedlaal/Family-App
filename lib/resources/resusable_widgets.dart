import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  const InputTextForm(
      {super.key,
      required this.email,
      required this.text,
      required this.icon,
      this.icon_end,
      this.obscuretext = false});
  final Icon icon;
  final String text;
  final bool obscuretext;
  final Icon? icon_end;
  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscuretext,
        controller: email,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          suffixIcon: icon_end,
          prefixIcon: icon,
        ));
  }
}
