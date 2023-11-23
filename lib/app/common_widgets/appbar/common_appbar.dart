import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final bool? visibility;
  const CommonAppBar({super.key, required this.label, this.visibility = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(color: primaryColor),
      ),
      centerTitle: false,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: svgWidget('assets/image/svg/arrow_back.svg',
              color: Colors.white)),
      title: Text(
        label,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      actions: const [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
