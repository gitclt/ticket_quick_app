import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
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
          ),
          ReportDetailsCard(
            tittle: 'Sync',
          ),
        ]),
      ),
    );
  }
}
