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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      10.0.spaceY,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: CommonSearchTextField(
                          hintText: 'Search route',
                        ),
                      ),
                      5.0.spaceY,
                      controller.items.isEmpty
                          ? Expanded(
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                  onPressed: () {
                                    controller.addItem('name', 'des');
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  // padding: const EdgeInsets.symmetric(horizontal: 6),
                                  itemCount: controller.items.length,
                                  itemBuilder: (context, index) {
                                    return RouteDetailsCard(
                                        onTap: () async {
                                          Get.toNamed(Routes.PAY_BILL);
                                        },
                                        tittle: controller.items[index]
                                            ['title'],
                                        //  'Perambra - Vadakara Via Payyoli DO',
                                        subtittle: 'Vadakara - Perambra');
                                  })),
                    ],
                  ),
          )),
      bottomNavigationBar: const BottomWidget(
        waybill: '10909345',
        condId: 'VK6939',
        etimName: '860679053421699',
        busNo: 'KL13T6939',
      ),
    );
  }
}
