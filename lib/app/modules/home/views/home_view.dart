import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/card/home_card.dart';

import 'package:ticket_quick_app/app/common_widgets/card/home_header_card.dart';
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
          const HeaderCard(),
          25.0.spaceY,
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                blackText("Categories", 18, fontWeight: FontWeight.w600),
                20.0.spaceY,
                const Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 15,
                  children: [
                    HomeCard(
                      path: "assets/image/svg/route.svg",
                      label: 'Route Details',
                    ),
                    HomeCard(
                      path: "assets/image/svg/report.svg",
                      label: 'Report',
                    ),
                    HomeCard(
                      path: "assets/image/svg/rupee.svg",
                      label: 'Expenses',
                    ),
                    HomeCard(
                      path: "assets/image/svg/power.svg",
                      label: 'End Shift',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
