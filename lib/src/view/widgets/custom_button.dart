import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large, custom }

enum IconPosition { left, right, leftEdge, rightEdge }

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final ButtonSize size;
  final double? customWidth;
  final double? customHeight;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.size = ButtonSize.medium,
    this.customWidth,
    this.customHeight,
    this.iconPosition = IconPosition.left,
  });

  double _getButtonWidth(BuildContext context) {
    switch (size) {
      case ButtonSize.small:
        return 0;
      case ButtonSize.medium:
        return MediaQuery.of(context).size.width * 0.5;
      case ButtonSize.large:
        return MediaQuery.of(context).size.width - 20.0;
      case ButtonSize.custom:
        return customWidth ?? 100.0;
    }
  }

  double _getButtonHeight() {
    switch (size) {
      case ButtonSize.small:
        return 40.0;
      case ButtonSize.medium:
        return 50.0;
      case ButtonSize.large:
        return 60.0;
      case ButtonSize.custom:
        return customHeight ?? 50.0;
    }
  }

  List<Widget> _buildButtonContent() {
    final iconWidget = icon != null ? Icon(icon) : const SizedBox.shrink();
    final textWidget = Text(text);
    const spacer = SizedBox(width: 9.0);

    switch (iconPosition) {
      case IconPosition.left:
        return [
          iconWidget,
          if (icon != null) spacer,
          textWidget,
        ];
      case IconPosition.right:
        return [
          textWidget,
          if (icon != null) spacer,
          iconWidget,
        ];
      case IconPosition.leftEdge:
        return [
          const Spacer(),
          iconWidget,
          const Spacer(),
          textWidget,
        ];
      case IconPosition.rightEdge:
        return [
          const Spacer(),
          textWidget,
          const Spacer(),
          iconWidget,
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _getButtonHeight(),
      width: size == ButtonSize.small ? null : _getButtonWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildButtonContent(),
        ),
      ),
    );
  }
}
