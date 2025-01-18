import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextInputType inputType;
  final bool isPassword;
  final List<String>? dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onDropdownChanged;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.dropdownItems,
    this.selectedValue,
    this.onChanged,
    this.onDropdownChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  Widget _buildTextFormField() {
    return TextFormField(
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
        suffixIcon: _buildSuffixIcon(),
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget _buildNumberField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String?>(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: widget.labelText,
      ),
      value: widget.selectedValue,
      items: widget.dropdownItems?.map((String item) {
        return DropdownMenuItem<String?>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: widget.onDropdownChanged,
    );
  }

  Widget? _buildSuffixIcon() {
    if (!widget.isPassword) return null;

    return IconButton(
      icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      onPressed: () => setState(() => _obscureText = !_obscureText),
    );
  }

  Widget _buildField() {
    if (widget.inputType == TextInputType.none) return Container();

    if (widget.inputType == TextInputType.datetime)
      return _buildDropdownField();

    if (widget.inputType == TextInputType.number) return _buildNumberField();

    if (widget.inputType == TextInputType.text ||
        widget.inputType == TextInputType.emailAddress ||
        widget.isPassword) {
      return _buildTextFormField();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: _buildField(),
    );
  }
}
