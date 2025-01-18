import 'package:flutter/material.dart';
import 'package:fe_kaashir/src/view/widgets/custom_button.dart';

class ImplCustomButton extends StatelessWidget {
  const ImplCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo Custom Text Field"),
      ),
      body: Column(
        children: <Widget>[
          // Using button small
          CustomButton(
            onPressed: () {
              // Your onPressed logic here
            },
            text: 'Small',
            icon: Icons.filter_1_outlined,
            size: ButtonSize.small,
          ),

          // Using button Medium
          CustomButton(
            onPressed: () {
              // Your onPressed logic here
            },
            text: 'Medium',
            size: ButtonSize.medium,
          ),

          // Using button Large
          CustomButton(
            onPressed: () {
              // Your onPressed logic here
            },
            text: 'Large',
            size: ButtonSize.large,
            icon: Icons.arrow_right_sharp,
            iconPosition: IconPosition.rightEdge,
          ),

          // Using button custom
          CustomButton(
            onPressed: () {
              // Your onPressed logic here
            },
            text: 'Custom Button',
            size: ButtonSize.custom,
            customWidth: 150.0,
            customHeight: 50.0,
          ),
        ],
      ),
    );
  }
}
