import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ivorypaypos/screens/home/homeScreens.dart';
import 'package:ivorypaypos/screens/manage_products/manage_products.dart';
import 'package:ivorypaypos/screens/printer_settings/printer_settings_screen.dart';
import 'package:ivorypaypos/screens/reports/reports_screen.dart';
import 'package:ivorypaypos/screens/salesScreen/sales_screen.dart';

class LayoutController extends ChangeNotifier {
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Iconsax.box_add), label: "Add Item"),
    BottomNavigationBarItem(
        icon: Icon(Iconsax.scan_barcode), label: "Scan QrCode"),
    // BottomNavigationBarItem(icon: Icon(Icons.report), label: "reports"),
    BottomNavigationBarItem(
        icon: Icon(Iconsax.printer), label: "Set Printer"),
  ];

  //NOTE: ---------------------------Screens and Titles----------------------------
  final screens = [WalletHomeScreen(), ManageProductsScreen(), SalesScreen(), PrinterSettingScreen()]; // ReportsScreen()

  final appbar_title = [
    'Home',
    'Add Item',
    'Scan Payment Code', /*'Report'*/
    'Printer Configuration'
  ];

  // NOTE: --------------------- On Change Index Of Screens ------------------

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onchangeIndex(int index) {
    _currentIndex = index;
    _issearching_InProducts = false;

    notifyListeners();
  }

  //NOTE on change Search Status in products
  bool _issearching_InProducts = false;

  bool get issearchingInProducts => _issearching_InProducts;
  onChangeSearchInProductsStatus(bool val) {
    _issearching_InProducts = val;
    _currentIndex = 0;
    notifyListeners();
  }
}
