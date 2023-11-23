import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/bottom_widget/home_bottom_widget.dart';
import 'package:ticket_quick_app/app/common_widgets/card/report_details_card.dart';
import 'package:ticket_quick_app/app/common_widgets/popup/end_shift_popup.dart';
import 'package:ticket_quick_app/app/routes/app_pages.dart';
import 'package:ticket_quick_app/constrains/services/sql_helper.dart';

import '../controllers/endshift_controller.dart';

class EndshiftView extends GetView<EndshiftController> {
  const EndshiftView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(label: "End Shift"),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            ReportDetailsCard(
              tittle: 'Select Report',
              path: "assets/image/svg/report_card.svg",
              onTap: () async {
                final data = await SQLHelper.getItems();

                controller.reportList = data;

                Get.toNamed(Routes.SHIFT_REPORT);
              },
            ),
            ReportDetailsCard(
              tittle: 'Sync',
              path: "assets/image/svg/sync.svg",
              onTap: () async {
                SQLHelper.deleteDatabaseFile();
                dynamic result = await showDialog(
                    context: context,
                    builder: (_) {
                      return const EndShiftExpenseDialog();
                    });
                if (result != null) {
                  List<Map<String, dynamic>> response = result;

                  for (var data in response) {
                    print('${data['text']}: ${data['value']}');
                  }
                }
              },
            ),
          ]),
        ),
        bottomNavigationBar: const BottomWidget());
  }
}
