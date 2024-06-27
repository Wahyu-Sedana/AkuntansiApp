import 'package:akuntansi_client/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:akuntansi_client/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _currentIndex = 0;

  final List<Widget> _pages = [const DashboardPage(), const ProfilePage()];

  int get currentIndex => _currentIndex;

  Widget get currentPage => _pages[_currentIndex];

  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
