import 'package:flutter/material.dart';

class SidebarItem {
  final String title;
  final IconData icon;
  // final Widget screen;
  final String routeName; // Tambahkan routeName

  const SidebarItem({
    required this.title,
    required this.icon,
    // required this.screen,
    required this.routeName,
  });
}

class CustomSidebar extends StatelessWidget {
  final List<SidebarItem> items;
  final ValueChanged<int> onItemTapped;

  const CustomSidebar({
    Key? key,
    required this.items,
    required this.onItemTapped,
  }) : super(key: key);

  Widget _buildListTile(int index, SidebarItem item) {
    return ListTile(
      leading: Icon(
        item.icon,
        size: 24,
      ),
      title: Text(item.title),
      onTap: () => onItemTapped(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) => _buildListTile(index, items[index]),
      ),
    );
  }
}