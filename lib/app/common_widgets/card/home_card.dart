import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class HomeCard extends StatelessWidget {
  final String path;
  final String label;
  // final Color color;
  final Function? onClick;
  const HomeCard({
    super.key,
    required this.path,
    required this.label,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          //   onClick!();
          // },
          onClick == null
              ? null
              : () {
                  onClick!();
                },
      child: Container(
        height: 100,
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: homeCatCardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.10), // Set the box shadow color
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                svgWidget(path),
                10.0.spaceY,
                blackText(label, 14, fontWeight: FontWeight.w500)
              ],
            ),
            // 18.0.spaceX,
            const Icon(Icons.navigate_next_outlined)
          ],
        ),
      ),
    );
  }
}
