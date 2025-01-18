import 'package:flutter/material.dart';

class CustomButtonPembayaran extends StatelessWidget {
  final List<CustomButtonData> buttons;

  const CustomButtonPembayaran({
    super.key,
    required this.buttons,
  });

  int _getColumnCount() {
    if (buttons.length <= 2) return 1;
    if (buttons.length <= 4) return 2;
    return 3;
  }

  double _calculateCellAspectRatio(BuildContext context, int columnCount) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight =
        size.height - padding.top - padding.bottom - appBarHeight;

    final rowCount = (buttons.length / columnCount).ceil();
    final gridAspectRatio = size.width / availableHeight;

    return (gridAspectRatio * rowCount) / columnCount;
  }

  Widget _buildButton(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => buttons[index].targetScreen,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              buttons[index].icon,
              size: 50,
              color: Colors.white,
            ),
            Text(
              buttons[index].label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight = MediaQuery.of(context).size.height -
        padding.top -
        padding.bottom -
        appBarHeight;

    final columnCount = _getColumnCount();
    final cellAspectRatio = _calculateCellAspectRatio(context, columnCount);

    return SizedBox(
      height: availableHeight,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          childAspectRatio: cellAspectRatio,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 7.0,
        ),
        itemBuilder: (context, index) => _buildButton(context, index),
      ),
    );
  }
}

class CustomButtonData {
  final IconData icon;
  final String label;
  final Widget targetScreen;

  const CustomButtonData({
    required this.icon,
    required this.label,
    required this.targetScreen,
  });
}
