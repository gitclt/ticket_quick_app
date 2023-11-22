import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_quick_app/app/common_widgets/button/login_button.dart';
import 'package:ticket_quick_app/app/common_widgets/divider.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/app/modules/pay_bill/views/pay_bill_view.dart';
import 'package:ticket_quick_app/constrains/app_color.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class RouteCatPopup extends StatefulWidget {
  final List<String> items;
  const RouteCatPopup({super.key, required this.items});

  @override
  State<RouteCatPopup> createState() => _RouteCatPopupState();
}

class _RouteCatPopupState extends State<RouteCatPopup>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation!,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        blackText('Category List', 16,
                            fontWeight: FontWeight.w600),
                        greyText('Total Fare : ₹ 13.00', 16,
                            fontWeight: FontWeight.w600, color: greenColor)
                      ],
                    ).paddingAll(20),
                    10.0.spaceY,
                    Column(
                      children: [
                        catRowValues('Adult'),
                        10.0.spaceY,
                        catRowValues('Student'),
                        10.0.spaceY,
                        catRowValues('Child'),
                        10.0.spaceY,
                        catRowValues('Disabled'),
                      ],
                    ).paddingOnly(left: 20, right: 20),
                    15.0.spaceY,
                    divider(),
                    15.0.spaceY,
                    SizedBox(
                      height: size.height * 0.08,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  //shrinkWrap: true,
                                  itemCount: widget.items.length,
                                  itemBuilder: (context, index) {
                                    return Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: categoryAmt(
                                          widget.items[index], () {}),
                                    ));
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.black),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Center(
                                    child: greyText('Clear All', 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    12.0.spaceY,
                    catRowValues('Luggage').paddingOnly(left: 20, right: 20),
                    15.0.spaceY,
                    divider(),
                    20.0.spaceY,
                    CommonButtonWidget(
                        label: 'Done',
                        onClick: () {
                          Get.back();
                        }).paddingOnly(left: 20, right: 20)
                  ]),
                ),
              )
            ]),
          )),
    );
  }
}

Widget categoryAmt(String amount, VoidCallback onTap) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0)
      ], borderRadius: BorderRadius.circular(6), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: blackText(amount, 18, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
