import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/bottom_widget/home_bottom_widget.dart';
import 'package:ticket_quick_app/app/common_widgets/card/route_details_card.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/search_textfield.dart';
import 'package:ticket_quick_app/app/routes/app_pages.dart';
import 'package:ticket_quick_app/constrains/space.dart';

import '../controllers/route_controller.dart';

class RouteView extends GetView<RouteController> {
  const RouteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(label: "Route Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const CommonSearchTextField(
              hintText: 'Search route',
            ),
            10.0.spaceY,
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return RouteDetailsCard(
                          onTap: () {
                            Get.toNamed(Routes.PAY_BILL);
                          },
                          tittle: 'Perambra - Vadakara Via Payyoli DO',
                          subtittle: 'Vadakara - Perambra');
                    }))
          ],
        ),
      ),
      bottomNavigationBar: const BottomWidget(
        waybill: '10909345',
        condId: 'VK6939',
        etimName: '860679053421699',
        busNo: 'KL13T6939',
      ),
    );
  }
}
