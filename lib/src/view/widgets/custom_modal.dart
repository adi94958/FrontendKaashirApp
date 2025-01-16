import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  const CustomModal({
    super.key,
    required this.header,
    required this.body,
    required this.footerButtons,
  });

  final String header;
  final Widget body;
  final List<Widget> footerButtons;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: _buildDialogShape(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            _buildBody(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  ShapeBorder _buildDialogShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Text(
        header,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: body,
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
        bottom: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildFooterButtons(),
      ),
    );
  }

  List<Widget> _buildFooterButtons() {
    return footerButtons.map((button) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: button,
      );
    }).toList();
  }
}