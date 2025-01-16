import 'package:flutter/material.dart';  
  
class CustomDateHeader extends StatelessWidget {  
  final String date;  
  final String price;  
  
  const CustomDateHeader({  
    Key? key,  
    required this.date,  
    required this.price,  
  }) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    return Padding(  
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),  
      child: Row(  
        mainAxisAlignment: MainAxisAlignment.spaceBetween,  
        children: [  
          _buildText(date),  
          _buildText(price),  
        ],  
      ),  
    );  
  }  
  
  // Method untuk membangun teks  
  Widget _buildText(String text) {  
    return Text(  
      text,  
      style: const TextStyle(fontSize: 16),  
    );  
  }  
}  
