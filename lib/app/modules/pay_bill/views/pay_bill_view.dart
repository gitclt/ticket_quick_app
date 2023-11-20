import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/login_textfield.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

import '../controllers/pay_bill_controller.dart';

class PayBillView extends GetView<PayBillController> {
  const PayBillView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(label: "Route Details"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const LoginTextField(hintText: 'From Stop'),
              15.0.spaceY,
              const LoginTextField(hintText: 'To Stop'),
              25.0.spaceY,
              Expanded(
                child: ListView.builder(
                    itemCount: controller.values.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: catRowValues(controller.values[index]),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

Widget catRowValues(String labels) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      blackText(labels, 16, fontWeight: FontWeight.w500),
      Row(
        children: [
          iconContainer(Icons.remove, () {}),
          15.0.spaceX,
          blackText('1', 12),
          15.0.spaceX,
          iconContainer(Icons.add, () {})
        ],
      )
    ],
  );
}

Widget iconContainer(IconData icon, VoidCallback onPress) {
  return Container(
    width: 30,
    height: 30,
    decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
            // blurStyle: BlurStyle.outer
          )
        ]),
    child: IconButton(
      icon: Icon(
        icon,
        size: 15,
      ),
      onPressed: () {
        onPress();
      },
    ),
  );
}
