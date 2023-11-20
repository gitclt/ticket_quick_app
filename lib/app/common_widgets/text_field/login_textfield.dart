import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;

  // final IconData? prefixIcon;
  final TextInputType? keytype;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final IconData? suffixIcon;
  const 
  LoginTextField({
    Key? key,
    this.isEnable,
    this.textInputType,
    this.suffixIconClick,

    // this.prefixIcon,
    this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
    this.textEditingController,
    this.validator,
    this.suffixIcon,
    this.keytype,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        textAlign: TextAlign.start,
        validator: validator,

        obscureText: obscureText,
        controller: textEditingController,
        enabled: isEnable ?? true,
        style: const TextStyle(
            fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w400),
        keyboardType: keytype,
        // TextInputType.number,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*')),
        //   LengthLimitingTextInputFormatter(10),
        // ],
        decoration: InputDecoration(
          fillColor: const Color(0xFFEEF2F6),
          // contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintStyle: const TextStyle(
            color: Color(0xffB2B2B2),
            fontSize: 14,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          isDense: true,
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  onPressed: () => suffixIconClick!(),
                  icon: Icon(
                    suffixIcon,
                    size: 20,
                    color: Colors.grey.withOpacity(.6),
                  ),
                ),
          // border: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
          //   borderRadius: BorderRadius.circular(16.0),
          // ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFF4F8F9),
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFF4F8F9),
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFF4F8F9),
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFF4F8F9),
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          prefixIcon: prefixIcon,
          // border: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(10),
          //   ),
          // ),
          hintText: hintText,
        ),
        //   borderSide: BorderSide(color: Colors.grey, width: 0.4),
        // ),
      ),
    );
  }
}
