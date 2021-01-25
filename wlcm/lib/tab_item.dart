import 'package:flutter/material.dart';
import 'app.dart';

class TabItem {
  // you can customize what kind of information is needed
  // for each tab
  final String tabName;
  final IconData icon;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  int _index = 0;
  Widget _page;
  TabItem({
    @required this.tabName,
    @required this.icon,
    @required Widget page,
  }) {
    _page = page;
  }

  void setIndex(int i) {
    _index = i;
  }

  int getIndex() => _index;


  Widget get page {
    return Visibility(
      visible: _index == AppState.currentTab,
      maintainState: true,
      child: Navigator(
        key: key,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (_) => _page,
          );
        },
      ),
    );
  }
}
