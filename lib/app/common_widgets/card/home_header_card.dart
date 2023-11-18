import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/button/login_button.dart';
import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(color: Color(0xFFF8F8F8)),
      child: Row(
        children: [
          svgWidget(
            "assets/image/svg/location.svg",
            // size: 10
          ),
          5.0.spaceX,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              blackText('Payyoli', 14, fontWeight: FontWeight.w700),
              blackText('Vadakara - Perambra', 10),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 120,
            height: 40,
            child: CommonButtonWidget(
              label: "Start Trip",
              onClick: () {},
            ),
          )
        ],
      ),
    );
  }
}
