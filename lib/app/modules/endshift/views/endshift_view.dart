import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/bottom_widget/home_bottom_widget.dart';
import 'package:ticket_quick_app/app/common_widgets/card/report_details_card.dart';

import '../controllers/endshift_controller.dart';

class EndshiftView extends GetView<EndshiftController> {
  const EndshiftView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CommonAppBar(label: "End Shift"),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(children: [
            ReportDetailsCard(
              tittle: 'Select Report',
              path: "assets/image/svg/report_card.svg",
            ),
            ReportDetailsCard(
              tittle: 'Sync',
              path: "assets/image/svg/sync.svg",
            ),
          ]),
        ),
        bottomNavigationBar: BottomWidget(
          waybill: '10909345',
          condId: 'VK6939',
          etimName: '860679053421699',
          busNo: 'KL13T6939',
        ));
  }
}
