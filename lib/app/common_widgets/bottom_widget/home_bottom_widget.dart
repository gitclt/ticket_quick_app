import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class BottomWidget extends StatelessWidget {
  final String waybill;
  final String condId;
  final String etimName;
  final String busNo;
  const BottomWidget({super.key, required this.waybill, required this.condId, required this.etimName, required this.busNo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                blackText('Waybill', 12),
                12.0.spaceY,
                blackText(waybill, 12)
              ],
            ),
             Column(
              children: [
                blackText('Cond Id', 12),
                12.0.spaceY,
                blackText(condId, 12)
              ],
            ),
             Column(
              children: [
                blackText('ETIM Name', 12),
                12.0.spaceY,
                blackText(etimName, 12)
              ],
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

        ],)
      ],
    );
  }
}
