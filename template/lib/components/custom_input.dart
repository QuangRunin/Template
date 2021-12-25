import 'package:flutter/material.dart';
import 'package:template/common/styles.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  final String? label;
  final bool activeObscureText;
  final Function onChanged;
  const CustomInput({
    Key? key,
    this.label,
    this.activeObscureText = false,
    required this.onChanged,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: false,
      style: size14W500Default,
      keyboardType: TextInputType.multiline,
      onChanged: (value) => onChanged(value),
      obscureText: activeObscureText ,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        labelText: label,
        labelStyle: size14W500Default,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const  BorderSide(color: Colors.black87),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide:  const BorderSide(color: Colors.black54)
        ),
      ),
    );
  }
}
