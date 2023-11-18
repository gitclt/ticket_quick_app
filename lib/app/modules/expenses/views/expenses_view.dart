import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/appbar/common_appbar.dart';
import 'package:ticket_quick_app/app/common_widgets/button/login_button.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/login_textfield.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

import '../controllers/expenses_controller.dart';

class ExpensesView extends GetView<ExpensesController> {
  const ExpensesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: CommonAppBar(label: "ETIM Expenses"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              blackText("Choose An Expense Type", 16,
                  fontWeight: FontWeight.w500),
              16.0.spaceY,
              DropdownButton(
                  hint: blackText('Select expense type', 14),
                  items: controller.option.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    controller.optioncontroller.text = value.toString();
                  }),
              16.0.spaceY,
              blackText("Choose An Expense Type", 16,
                  fontWeight: FontWeight.w500),
              16.0.spaceY,
              const LoginTextField(hintText: ""),
              16.0.spaceY,
              CommonButtonWidget(
                label: "Submit",
                onClick: () {},
                borderRadius: 6,
              )
            ]),
      ),
    );
  }
}
