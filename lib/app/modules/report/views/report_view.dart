import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/card/report_details_card.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(label: "Select Report"),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const ReportDetailsCard(
                    tittle: 'New Auditor Report',
                  );
                }))
      ]),
    );
  }
}
