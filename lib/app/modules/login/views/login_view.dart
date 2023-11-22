import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/button/login_button.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/login_textfield.dart';
import 'package:ticket_quick_app/app/routes/app_pages.dart';
import 'package:ticket_quick_app/constrains/space.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/png/bus_logo.png',
                ),
                const LoginTextField(hintText: "Username"),
                16.0.spaceY,
                const LoginTextField(hintText: "Password"),
                25.0.spaceY,
                CommonButtonWidget(
                  label: "Proceed",
                  onClick: () {
                    Get.toNamed(Routes.PROCEED);
                  },
                  borderRadius: 6,
                )
              ]),
        ),
      ),
    );
  }
}
