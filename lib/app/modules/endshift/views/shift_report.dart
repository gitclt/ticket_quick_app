import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/modules/endshift/controllers/endshift_controller.dart';

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
            : ListView.builder(
                itemCount: controller.reportList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(controller.reportList[index]['busId']),
                    title: Text(controller.reportList[index]['expenseType']),
                    subtitle:
                        Text(controller.reportList[index]['expenseValue']),
                  );
                }),
      ),
    );
  }
}
