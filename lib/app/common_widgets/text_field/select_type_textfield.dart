import 'package:flutter/material.dart';

class ItemSelectTextField extends StatelessWidget {
  final String hintText;
  final Function? onChanged;
  final Function? onPressed;
  final FormFieldValidator? validator;
  final bool autofocus;
  final Function? onTap;
  final double? borderRadius;
  final TextEditingController? textEditingController;
  final bool isEnabled;
  final bool? readOnly;
  const ItemSelectTextField({
    Key? key,
    this.onChanged,
    this.onPressed,
    this.autofocus = false,
    this.textEditingController,
    required this.hintText,
    this.onTap,
    this.isEnabled = true,
    this.readOnly = false,
    this.validator,
    this.borderRadius = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 15, color: Colors.black),
      controller: textEditingController,
      autofocus: autofocus,
      readOnly: readOnly!,
      validator: validator,
      enabled: isEnabled,
      //  textAlign: isCenterText == null ? TextAlign.start : TextAlign.center,
      onTap: onTap == null
          ? null
          : () {
              onTap!();
            },
      onChanged: onChanged == null
          ? null
          : (String? value) {
              onChanged!(value);
            },
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xfff3f3f3),
            ),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xfff3f3f3),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xfff3f3f3),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: const Color(0xffEEF2F6),
          filled: true,
          // filled: true,
          isDense: true,
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
          suffixIcon: IconButton(
              onPressed: onPressed == null
                  ? null
                  : () {
                      onPressed!();
                    },
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
                size: 25,
              ))),
    );
  }
}
