import 'package:flutter/material.dart';

class DrowpDownButton extends StatelessWidget {
  final FormFieldValidator validator;
  final Function onChanged;
  final String label;
  final String hintText;
  final Color? colors;
  final List<DropdownMenuItem<dynamic>> iteams;
  const DrowpDownButton({
    super.key,
    required this.validator,
    required this.onChanged,
    required this.iteams,
    required this.label,
    required this.hintText,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      
      borderRadius: BorderRadius.circular(6),
      icon: const Icon(
        Icons.expand_more_outlined,
        size: 25,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9A9A9A)),
        labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
        fillColor: const Color(0xFFEEF2F6),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEEF2F6), width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEEF2F6), width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEEF2F6), width: .5),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      validator: validator,
      items: iteams,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
