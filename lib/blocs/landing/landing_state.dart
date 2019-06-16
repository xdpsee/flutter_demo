import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class LandingState extends Equatable {
  final List<_NavigationItemDesc> _navigationItemDescList = [
    _NavigationItemDesc(Icons.home, "首页"),
    _NavigationItemDesc(Icons.email, "消息"),
    _NavigationItemDesc(Icons.settings, "设置"),
    _NavigationItemDesc(Icons.account_box, "我的"),
  ];

  final int currentPage;

  LandingState(this.currentPage) : super([currentPage]);

  List<BottomNavigationBarItem> get navigationBarItems =>
      _navigationItemDescList
          .map((desc) => BottomNavigationBarItem(
              icon: Icon(desc.icon), title: Text(desc.title)))
          .toList(growable: false);
}

class LandingStateUninitialized extends LandingState {
  LandingStateUninitialized() : super(-1);
}

class LandingStatePageActivated extends LandingState {
  LandingStatePageActivated(int activePage) : super(activePage);
}

class _NavigationItemDesc {
  final IconData icon;
  final String title;

  _NavigationItemDesc(this.icon, this.title);
}
