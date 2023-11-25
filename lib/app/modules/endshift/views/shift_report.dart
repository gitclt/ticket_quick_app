import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/modules/endshift/controllers/endshift_controller.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';

class ShiftReportView extends GetView<EndshiftController> {
  const ShiftReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(label: 'Shift Report'),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                    itemCount: controller.reportList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      const evenColor = reportcolor1;
                      const oddColor = reportcolor2;

                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: index % 2 == 0 ? evenColor : oddColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.reportList[index]['expenseType'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            //  5.0.spaceY,
                            Text(
                                controller.reportList[index]['expenseValue'] ==
                                        ''
                                    ? '0'
                                    : controller.reportList[index]
                                        ['expenseValue'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ).paddingOnly(left: 10),
                      ).paddingOnly(bottom: 5);
                    }),
              ),
      ),
    );
  }
}
