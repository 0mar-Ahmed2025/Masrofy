import 'package:flutter/material.dart';
import 'package:masrofy/features/home/view/tabs/expenses_tab.dart';
import 'package:masrofy/features/home/view/tabs/home_tab.dart';
import 'package:masrofy/features/home/view/tabs/more_tab.dart';
import 'package:masrofy/features/home/view/tabs/reports_tab.dart';
import 'package:masrofy/features/home/view/widgets/home_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    ReportsTab(),
    SizedBox.shrink(),
    ExpensesTab(),
    MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentNavIndex, children: _tabs),
      ),
      bottomNavigationBar: HomeBottomNavigation(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }
}
