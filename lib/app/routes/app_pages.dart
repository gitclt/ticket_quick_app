import 'package:get/get.dart';
import 'package:ticket_quick_app/app/modules/endshift/views/shift_report.dart';

import '../modules/endshift/bindings/endshift_binding.dart';
import '../modules/endshift/views/endshift_view.dart';
import '../modules/expenses/bindings/expenses_binding.dart';
import '../modules/expenses/views/expenses_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/procced.dart';
import '../modules/pay_bill/bindings/pay_bill_binding.dart';
import '../modules/pay_bill/views/pay_bill_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/route/bindings/route_binding.dart';
import '../modules/route/views/route_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROCEED,
      page: () => const Proceed(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROUTE,
      page: () => const RouteView(),
      binding: RouteBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSES,
      page: () => const ExpensesView(),
      binding: ExpensesBinding(),
    ),
    GetPage(
      name: _Paths.ENDSHIFT,
      page: () => const EndshiftView(),
      binding: EndshiftBinding(),
    ),
    GetPage(
      name: _Paths.PAY_BILL,
      page: () => const PayBillView(),
      binding: PayBillBinding(),
    ),
    GetPage(
      name: _Paths.SHIFT_REPORT,
      page: () => const ShiftReportView(),
      binding: EndshiftBinding(),
    ),
  ];
}
