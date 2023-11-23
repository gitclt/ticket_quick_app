import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/popup/common_init.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/underline_textfield.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/app/modules/endshift/controllers/endshift_controller.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';
import 'package:ticket_quick_app/constrains/services/sql_helper.dart';

class EndShiftExpenseDialog extends StatefulWidget {
  const EndShiftExpenseDialog({super.key});

  @override
  State<EndShiftExpenseDialog> createState() => _EndShiftExpenseDialogState();
}

class _EndShiftExpenseDialogState extends State<EndShiftExpenseDialog>
    with SingleTickerProviderStateMixin {
  late MyAnimationController animationController;
  EndshiftController endshiftController = Get.find();

  @override
  void initState() {
    super.initState();

    animationController = MyAnimationController(this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: animationController.scaleAnimation!,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.04,
              right: size.width * 0.04,
            ),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close),
                            color: Colors.white,
                          ),
                          greyText('Expenses', 18,
                              color: Colors.white, fontWeight: FontWeight.w600),
                          TextButton(
                              onPressed: () async {
                                List<Map<String, dynamic>> result = [];
                                for (var model
                                    in endshiftController.enteredValues) {
                                  result.add({
                                    'id': model.id,
                                    'text': model.text,
                                    'value': model.value,
                                  });

                                  await SQLHelper.deleteItem(
                                      endshiftController.enteredValues);

                                  // await SQLHelper.createItem(
                                  //     model.id, model.text, model.value);
                                }

                                Get.back(result: result);
                              },
                              child: greyText('Save', 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: List.generate(
                            endshiftController.enteredValues.length, (index) {
                          return SizedBox(
                            width: size.width * 0.40,
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                blackText(
                                    endshiftController
                                        .enteredValues[index].text,
                                    15,
                                    fontWeight: FontWeight.w500),
                                SizedBox(
                                  height: size.height * 0.05,
                                  child: UnderlineTextField(
                                    hint: '0',
                                    onChanged: (value) {
                                      endshiftController
                                          .enteredValues[index].value = value;
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
