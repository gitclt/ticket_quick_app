import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class RouteDetailsCard extends StatelessWidget {
  final String tittle, subtittle;
  final Function? onTap;
  const RouteDetailsCard({
    super.key,
    required this.tittle,
    required this.subtittle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
                onTap!();
              },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    blackText(tittle, 16, fontWeight: FontWeight.w500),
                  ],
                ),
                5.0.spaceY,
                Row(
                  children: [
                    blackText(subtittle, 14, fontWeight: FontWeight.w400)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
