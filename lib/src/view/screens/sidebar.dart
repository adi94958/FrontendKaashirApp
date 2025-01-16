import 'package:flutter/material.dart';
import '../widgets/custom_sidebar.dart';
import '../../routes/app_routes.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  String _appBarTitle = 'Transaksi';
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  final List<String> _titles = const [
    // 'Transaksi',
    // 'Riwayat Transaksi',
    // 'Kelola Produk',
    // 'Data Pelanggan',
    // 'Pengaturan',
    'Implement Modal',
    'Implement List Item'
  ];

  final List<String> _routes = [
    // AppRoutes.transaksi, // Contoh route untuk "Transaksi"
    // AppRoutes.riwayatPenjualan,
    // AppRoutes.dataProduk,
    // AppRoutes.dataPelanggan,
    // AppRoutes.pengaturan,
    AppRoutes.implementModal,
    AppRoutes.implementListItem,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appBarTitle = _titles[index];
    });
    // Navigator.pop(context);
    Navigator.pushNamed(context, _routes[index]);
  }

  List<SidebarItem> _buildSidebarItems() {
    final List<IconData> icons = const [
      Icons.attach_money,
      Icons.history,
      // Icons.production_quantity_limits,
      // Icons.person,
      // Icons.settings,
    ];

    return List.generate(
      _routes.length,
      (index) => SidebarItem(
        title: _titles[index],
        icon: icons[index],
        routeName: _routes[index],
      ),
    );
  }

  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _titles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.menu),
            title: Text(_titles[index]),
            onTap: () => _onItemTapped(index),
          );
        },
      ),
    );
  }
}