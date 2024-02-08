import 'package:flutter/material.dart';

import '../models/admin.dart';

class ContributorCrossService extends ChangeNotifier {
  final List<Admin> _contributors = [];

  void addAdminToList(Admin admin) {
    _contributors.add(admin);
    notifyListeners();
  }

  void removeAdminFromList(Admin admin) {
    _contributors.remove(admin);
    notifyListeners();
  }
  void resetProvider(){
    _contributors.clear();
    notifyListeners();
  }
  List<Admin> get contributors => _contributors;
}
