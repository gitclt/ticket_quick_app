import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/button/login_button.dart';
import 'package:ticket_quick_app/app/common_widgets/popup/route_categories_popup.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/login_textfield.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginTextField(hintText: 'From Stop'),
            15.0.spaceY,
            const LoginTextField(hintText: 'To Stop'),
            25.0.spaceY,
            Column(
              children: [
                catRowValues('Adult'),
                10.0.spaceY,
                catRowValues('Student'),
              ],
            ),
            10.0.spaceY,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: homeCatCardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () async {
                      final response = await showDialog(
                          context: context,
                          builder: (_) {
                            return RouteCatPopup(
                              items: controller.values,
                            );
                          });
                        if(response != null){
                          
                        }
                    },
                    child: blackText('All Categories', 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                greyText('Total Fare : ₹ 13.00', 16,
                    fontWeight: FontWeight.w600, color: greenColor)
              ],
            ),
            30.0.spaceY,
            CommonButtonWidget(label: 'Cash', onClick: () {})
          ],
        ),
      ),
    );
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
      icon: Text(
        String.fromCharCode(icon.codePoint),
        style: TextStyle(
          // inherit: false,
          color: Colors.black,
          fontSize: 12.0,
          fontWeight: FontWeight.w800,
          fontFamily: icon.fontFamily,
        ),
      ),
      onPressed: () {
        onPress();
      },
    ),
  );
}
