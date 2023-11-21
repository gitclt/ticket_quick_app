import 'package:flutter/material.dart';

class UnderlineTextField extends StatelessWidget {
  final TextEditingController? controller;
  // final String? label;
  final String hint;
  final TextInputType? keyboard;
  final Function? onChanged;

  const UnderlineTextField(
      {super.key,
      this.controller,
      required this.hint,
      this.keyboard,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
     onChanged: onChanged == null
          ? null
          : (String? value) {
              onChanged!(value);
            },
      keyboardType: keyboard ?? TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,

        hintStyle:
            const TextStyle(color: Colors.grey), // Color of the hint text
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black), // Color of the underline when not focused
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black), // Color of the underline when focused
        ),
      ),
    );
  }
}
