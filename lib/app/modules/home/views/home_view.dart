import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/button/login_button.dart';
import 'package:ticket_quick_app/app/common_widgets/card/home_header_card.dart';
import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderCard(),
          25.0.spaceY,
          blackText("Categories", 18, fontWeight: FontWeight.w600),
          HomeCard(
            path: "assets/image/svg/route.svg",
            label: 'Route Details',
          )
        ]),
      ),
    );
  }
}

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
      onTap: () {
        onClick!();
      },
      child: Container(
        height: 100,
        width: 150,
        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xffF1F9FF), borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                19.0.spaceY,
                svgWidget(path),
                5.0.spaceY,
                blackText(label, 14, fontWeight: FontWeight.w500)
              ],
            ),
            Icon(Icons.navigate_next_outlined)
          ],
        ),
      ),
    );
  }
}
