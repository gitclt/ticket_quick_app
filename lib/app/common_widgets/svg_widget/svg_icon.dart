import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';

Widget svgWidget(String path,
        {double? size,
        BoxFit? value = BoxFit.scaleDown,
        BlendMode? blendMode = BlendMode.srcIn,
        Color? color = primaryColor}) =>
    SvgPicture.asset(
      path,
      height: size,
      width: size,
      fit: value!,
      colorFilter: ColorFilter.mode(color!, blendMode!),
    );
