import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.tabViews,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: TabBar(
            controller: _tabController,
            tabs: widget.tabs.map((tab) {
              return Tab(
                height: 55,
                child: Row(
                  children: [
                    if (tab.icon != null) ...[
                      tab.icon!,
                      SizedBox(width: 7),
                    ],
                    if (tab.text != null)
                      Expanded(
                        child: Text(
                          tab.text!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
