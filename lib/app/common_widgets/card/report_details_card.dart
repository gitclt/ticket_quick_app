import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class ReportDetailsCard extends StatelessWidget {
  final String tittle;
  final String path;
  final Function onTap;
  const ReportDetailsCard({
    super.key,
    required this.tittle,
    required this.path,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  svgWidget(path),
                  20.0.spaceX,
                  blackText(tittle, 16, fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
