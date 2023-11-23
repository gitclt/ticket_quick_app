import 'package:get/get.dart';
import 'package:ticket_quick_app/app/models/end_shift_model.dart';

class EndshiftController extends GetxController {
  final enteredValues = <EndShiftModel>[];
  List<Map<String, dynamic>> reportList = [];
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    enteredValues.addAll([
      EndShiftModel(id: '1', text: 'Driver Salary', value: ''),
      EndShiftModel(id: '2', text: 'Conductor Salary', value: ''),
      EndShiftModel(id: '3', text: 'Association Fees', value: ''),
      EndShiftModel(id: '4', text: 'Fuel', value: ''),
      EndShiftModel(id: '5', text: 'Helper', value: ''),
      EndShiftModel(id: '6', text: 'Maintenance', value: ''),
      EndShiftModel(id: '7', text: 'Operator’s Take', value: ''),
      EndShiftModel(id: '8', text: 'Cleaning Expenses', value: ''),
      EndShiftModel(id: '9', text: 'Penalty Paid', value: ''),
      EndShiftModel(id: '10', text: 'Others', value: '')
    ]);
   // deleteFile();
  }

  // void deleteFile() async {
  //   await SQLHelper.deleteDatabaseFile();
  // }
}
