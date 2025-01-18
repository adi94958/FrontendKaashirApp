import 'package:flutter/material.dart';
import '../view/widgets/custom_button_pembayaran.dart';
import '../implement_widget/impl_custom_button.dart';
import '../implement_widget/impl_custom_text_field.dart';
import '../implement_widget/impl_custom_tabs.dart';
import '../implement_widget/impl_custom_searchbar.dart';

class ImplCustomButtonPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CustomButtonData> buttons = [
      CustomButtonData(
        icon: Icons.attach_money,
        label: 'Pembayaran Zakat',
        targetScreen: ImplCustomButton(),
      ),
      CustomButtonData(
        icon: Icons.history,
        label: 'Riwayat Zakat',
        targetScreen: ImplCustomSearchBar(),
      ),
      // CustomButtonData(
      //   icon: Icons.money,
      //   label: 'Tunai',
      //   targetScreen: ImplCustomTabs(),
      // ),
      // CustomButtonData(
      //   icon: Icons.transfer_within_a_station,
      //   label: 'Transfer',
      //   targetScreen: ImplCustomTextField(),
      // ),
      // Add more buttons as needed
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo Button Pembayaran"),
      ),
      body: SafeArea(
        child: CustomButtonPembayaran(buttons: buttons),
      ),
    );
  }
}
