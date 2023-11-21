import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/popup/common_init.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';

class ExpenseTypePopup extends StatefulWidget {
  final int itemCount;
  final List<String> title;
  const ExpenseTypePopup(
      {super.key, required this.itemCount, required this.title});

  @override
  State<ExpenseTypePopup> createState() => _ExpenseTypePopupState();
}

class _ExpenseTypePopupState extends State<ExpenseTypePopup>
    with SingleTickerProviderStateMixin {
  late MyAnimationController animationController;
  // AnimationController? controller;
  // Animation<double>? scaleAnimation;

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
                    top: size.height * 0.1,
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    bottom: size.height * 0.18),
                child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  child: Column(children: [
                    Container(
                        //width: double.maxFinite,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Center(
                          child: greyText('Select Expense Type', 18,
                              color: Colors.white),
                        )),
                    Expanded(
                        child: ListView.builder(
                            itemCount: widget.itemCount,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(widget.title[index]),
                                onTap: () {
                                  Get.back(result: widget.title[index]);
                                },
                              );
                            }))
                  ]),
                ),
              )
            ]),
          )),
    );
  }
}
