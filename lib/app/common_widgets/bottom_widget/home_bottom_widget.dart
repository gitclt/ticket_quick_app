// import 'package:flutter/material.dart';
// import 'package:ticket_quick_app/app/common_widgets/svg_widget/svg_icon.dart';
// import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
// import 'package:ticket_quick_app/constrains/space.dart';

// class BottomWidget extends StatelessWidget {
//   // final String waybill;
//   // final String condId;
//   // final String etimName;
//   // final String busNo;

//   const BottomWidget(
//       {super.key,
//       // required this.waybill,
//       // required this.condId,
//       // required this.etimName,
//       // required this.busNo
//       });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height * 0.145,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   children: [
//                     blackText('Waybill', 12),
//                     10.0.spaceY,
//                     blackText('10909345', 12)
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     blackText('Cond Id', 12),
//                     10.0.spaceY,
//                     blackText('VK6939', 12)
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     blackText('ETIM Name', 12),
//                     10.0.spaceY,
//                     blackText('860679053421699', 12)
//                   ],
//                 )
//               ],
//             ),
//             20.0.spaceY,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: [
//                     svgWidget('assets/image/svg/battery.svg'),
//                     4.0.spaceX,
//                     blackText('100%', 12)
//                   ],
//                 ),
//                 blackText('v1.4.43', 12),
//                 blackText('Bus No : KL13T6939', 12)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:ticket_quick_app/app/common_widgets/texts/color_text.dart';
import 'package:ticket_quick_app/constrains/space.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({
    super.key,
  });

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  Battery battery = Battery();
  late StreamController<int> _batteryStreamController;
  late Stream<int> _batteryStream;
  int _batteryLevel = 0;

  @override
  void initState() {
    super.initState();

    _batteryStreamController = StreamController<int>();
    _batteryStream = _batteryStreamController.stream;

    _getBatteryLevel();

    Timer.periodic(Duration(seconds: 30), (timer) {
      _getBatteryLevel();
    });

    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    final batteryLevel = await battery.batteryLevel;
    if (mounted) {
      setState(() {
        _batteryLevel = batteryLevel;
      });
    }

    _batteryStreamController.add(_batteryLevel);
  }

  // void _startBatteryStream() {
  //   _battery.batteryStream.listen((event) {
  //     _batteryStreamController.add(event);
  //   });
  // }

  IconData _getBatteryIcon(int batteryLevel) {
    if (batteryLevel >= 90) {
      return Icons.battery_full;
    } else if (batteryLevel >= 20) {
      return Icons.battery_charging_full;
    } else {
      return Icons.battery_alert;
    }
  }

  @override
  void dispose() {
    //  _batteryStreamController.close();
    super.dispose();
  }

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
                    blackText('10909345', 12)
                  ],
                ),
                Column(
                  children: [
                    blackText('Cond Id', 12),
                    10.0.spaceY,
                    blackText('VK6939', 12)
                  ],
                ),
                Column(
                  children: [
                    blackText('ETIM Name', 12),
                    10.0.spaceY,
                    blackText('860679053421699', 12)
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
                    Icon(
                        _getBatteryIcon(
                          _batteryLevel,
                        ),
                        size: 20,
                        color: Colors.green
                        // Icons.battery_full? Colors.green : Colors.red,
                        ),
                    // svgWidget('assets/image/svg/battery.svg'),
                    4.0.spaceX,
                    StreamBuilder<int>(
                        stream: _batteryStream,
                        initialData: _batteryLevel,
                        builder: (context, snapshot) {
                          return blackText('${snapshot.data}%', 12);
                        })
                  ],
                ),
                blackText('v1.4.43', 12),
                blackText('Bus No : KL13T6939', 12)
              ],
            )
          ],
        ),
      ),
    );
  }
}
