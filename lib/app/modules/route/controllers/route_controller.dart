import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ticket_quick_app/constrains/services/sql_database.dart';

class RouteController extends GetxController {
 
  static Database? mydatabase;
  var isLoading = false.obs;
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  void getItems() async {
    final data = await SQLHelper.getItems();
    print('list: $data');

    items.value = data;
  }

  Future<void> addItem(String title, String description) async {
    int allData = await SQLHelper.createItem(title, description);
    print('added: $allData');
    getItems();
  }

}
