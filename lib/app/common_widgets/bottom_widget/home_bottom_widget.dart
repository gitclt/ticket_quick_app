import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class BottomWidget extends StatelessWidget {
  final String waybill;
  final String condId;
  final String etimName;
  final String busNo;
  const BottomWidget(
      {super.key,
      required this.waybill,
      required this.condId,
      required this.etimName,
      required this.busNo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.145,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    blackText('Waybill', 12),
                    10.0.spaceY,
                    blackText(waybill, 12)
                  ],
                ),
                Column(
                  children: [
                    blackText('Cond Id', 12),
                    10.0.spaceY,
                    blackText(condId, 12)
                  ],
                ),
                Column(
                  children: [
                    blackText('ETIM Name', 12),
                    10.0.spaceY,
                    blackText(etimName, 12)
                  ],
                )
              ],
            ),
            20.0.spaceY,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    svgWidget('assets/image/svg/battery.svg'),
                    4.0.spaceX,
                    blackText('100%', 12)
                  ],
                ),
                blackText('v1.4.43', 12),
                blackText('Bus No : $busNo', 12)
              ],
            )
          ],
        ),
      ),
    );
  }
}
