import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class RouteDetailsCard extends StatelessWidget {
  final String tittle, subtittle;
  final Function? onTap;
  const RouteDetailsCard({
    super.key,
    required this.tittle,
    required this.subtittle, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
                onTap!();
              },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0, 0),
                blurRadius: 20,
                spreadRadius: 0,
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
    );
  }
}
