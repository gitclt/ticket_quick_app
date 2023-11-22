import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/bottom_widget/home_bottom_widget.dart';
import 'package:ticket_quick_app/app/common_widgets/card/report_details_card.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(label: "Select Report"),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ReportDetailsCard(
                    tittle: 'New Auditor Report',
                    path: "assets/image/svg/report_card.svg", onTap: (){},
                  );
                }))
      ]),
      bottomNavigationBar: const BottomWidget(
    
      ),
    );
  }
}
