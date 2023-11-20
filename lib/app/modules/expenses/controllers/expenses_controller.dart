import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesController extends GetxController {
  TextEditingController typeController = TextEditingController();

  final List<String> options = [
    'Driver Salary',
    'Conductor Salary',
    'Association Fees',
    'Fuel',
    'Helper',
    'Maintenance',
    'Operator’s Take',
    'Cleaning Expenses',
    'Penalty Paid',
    'Others'
  ];
}
