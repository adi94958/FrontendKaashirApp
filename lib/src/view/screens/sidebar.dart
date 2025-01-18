import 'package:flutter/material.dart';
import '../widgets/custom_sidebar.dart';
import '../../routes/app_routes.dart';
class Sidebar extends StatefulWidget {
  final String title;
  final Widget child;
  const Sidebar({
    super.key,
    required this.title,
    required this.child,
  });
  @override
  State<Sidebar> createState() => _SidebarState();
}
class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  final List<SidebarItem> _sidebarItems = [
    SidebarItem(
        title: 'Transaksi',
        icon: Icons.attach_money,
        routeName: AppRoutes.transaksi),
    SidebarItem(
        title: 'Riwayat Transaksi',
        icon: Icons.history,
        routeName: AppRoutes.riwayatPenjualan),
    SidebarItem(
        title: 'Kelola Produk',
        icon: Icons.production_quantity_limits,
        routeName: AppRoutes.dataProduk),
    SidebarItem(
        title: 'Transaksi',
        icon: Icons.person,
        routeName: AppRoutes.implementListItemProduct),
    SidebarItem(
        title: 'Form',
        icon: Icons.settings,
        routeName: AppRoutes.implementFilterForm),
    SidebarItem(
        title: 'Implement Modal',
        icon: Icons.attach_money,
        routeName: AppRoutes.implementModal),
    SidebarItem(
        title: 'Implement List Item',
        icon: Icons.history,
        routeName: AppRoutes.implementListItem),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // Tutup drawer
    Navigator.of(context).pushReplacementNamed(
        _sidebarItems[index].routeName); // Navigasi ke rute yang dipilih
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Use the updated title
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: CustomSidebar(
        items: _sidebarItems,
        onItemTapped: _onItemTapped,
      ),
      backgroundColor: Colors.white,
      body: widget.child,
    );
  }
}
