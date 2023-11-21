import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/popup/common_init.dart';
import 'package:ticket_quick_app/app/common_widgets/text_field/underline_textfield.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/app/models/end_shift_model.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';

class EndShiftExpenseDialog extends StatefulWidget {
  final List<String> title;
  final VoidCallback? onEnteredValue;
  const EndShiftExpenseDialog(
      {super.key, required this.title, this.onEnteredValue});

  @override
  State<EndShiftExpenseDialog> createState() => _EndShiftExpenseDialogState();
}

class _EndShiftExpenseDialogState extends State<EndShiftExpenseDialog>
    with SingleTickerProviderStateMixin {
  late MyAnimationController animationController;

  List<EndShiftModel> enteredValues = [];

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

    return Center(
      child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: animationController.scaleAnimation!,
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.18,
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    bottom: size.height * 0.20),
                child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  child: Column(children: [
                    Container(
                        //width: double.maxFinite,
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
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            TextButton(
                                onPressed: () {
                                  Get.back(result: getEnteredValues());
                                },
                                child: greyText('Save', 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600))
                          ],
                        )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      child: Wrap(
                          spacing: 12,
                          runSpacing: 15,
                          alignment: WrapAlignment.spaceBetween,
                          //  runAlignment: WrapAlignment.center,
                          children: List.generate(widget.title.length, (index) {
                            return SizedBox(
                              width: size.width * 0.40,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  blackText(widget.title[index], 15,
                                      fontWeight: FontWeight.w500),
                                  SizedBox(
                                    height: size.height * 0.05,
                                    child: UnderlineTextField(
                                      hint: '0',
                                      onChanged: (value) {
                                        updateEnteredValue(value);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                    ))
                  ]),
                ),
              )
            ]),
          )),
    );
  }

  void updateEnteredValue(value) {}

  List<EndShiftModel> getEnteredValues() {
    return enteredValues;
  }
}
