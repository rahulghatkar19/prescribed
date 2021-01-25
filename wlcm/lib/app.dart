import 'package:covid_19/screens/health_page.dart';
import 'package:covid_19/screens/home_page.dart';
import 'package:covid_19/screens/prescription_list.dart';
import 'package:covid_19/screens/profile_page.dart';
import 'package:covid_19/screens/reminder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tab_item.dart';
import 'bottom_navigation.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  static int currentTab = 0;
  final profileIcon = SvgPicture.asset('assets/icons/user.svg');
  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home,
      page: HomePage(),
    ),
    TabItem(
      tabName: "Health",
      icon: Icons.pages_outlined,
      page: HealthPage(),
    ),
    TabItem(
      tabName: "Prescriptions",
      icon: Icons.receipt_long,
      page: PrescriptionList(),
    ),
    TabItem(
      tabName: "Reminder",
      icon: Icons.notifications,
      page: ReminderPage(),
    ),
    TabItem(
      tabName: "Profile",
      icon: Icons.person_rounded,
      page: ProfilePage(),
    ),
  ];

  AppState() {
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}
