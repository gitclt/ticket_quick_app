import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/card/route_details_card.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/search_textfield.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

import '../controllers/route_controller.dart';

class RouteView extends GetView<RouteController> {
  const RouteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(label: "Route Details"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CommonSearchTextField(
              hintText: 'Search route',
            ),
            10.0.spaceY,
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const RouteDetailsCard(
                          tittle: 'Perambra - Vadakara Via Payyoli DO',
                          subtittle: 'Vadakara - Perambra');
                    }))
            // RouteDetailsCard()
          ],
        ),
      ),
    );
  }
}
