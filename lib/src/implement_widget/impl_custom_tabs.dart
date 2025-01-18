import 'package:flutter/material.dart';
import 'package:fe_kaashir/src/view/widgets/custom_tabs.dart';

class ImplCustomTabs extends StatelessWidget {
  const ImplCustomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Demo Custom Tabs"),
        ),
        body: CustomTabBar(
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.star), text: 'Favorites'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
            Tab(icon: Icon(Icons.calculate), text: 'Calculator'),
          ],
          tabViews: [
            Center(child: Text('Home Content')),
            Center(child: Text('Favorites Content')),
            Center(child: Text('Settings Content')),
            Center(child: Text('Calculator Content')),
          ],
        ));
  }
}
