import 'package:flutter/material.dart';  
  
class CustomListItemNavigation extends StatelessWidget {  
  final String title;  
  final String subtitle;  
  final String rightText;  
  final VoidCallback onTap;  
  
  const CustomListItemNavigation({  
    Key? key,  
    required this.title,  
    required this.subtitle,  
    required this.rightText,  
    required this.onTap,  
  }) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    return InkWell(  
      onTap: onTap,  
      splashColor: Colors.black.withOpacity(0.2),  
      highlightColor: Colors.black.withOpacity(0.1),  
      child: Container(  
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),  
        decoration: BoxDecoration(  
          border: Border(  
            top: BorderSide(  
              color: Colors.grey.withOpacity(0.5),  
              width: 1.0,  
            ),  
            bottom: BorderSide(  
              color: Colors.grey.withOpacity(0.5),  
              width: 1.0,  
            ),  
          ),  
        ),  
        child: Row(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  
          children: [  
            _buildTextColumn(),  
            _buildRightTextAndIcon(),  
          ],  
        ),  
      ),  
    );  
  }  
  
  // Method untuk membangun kolom teks kiri  
  Widget _buildTextColumn() {  
    return Expanded(  
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: [  
          Text(  
            title,  
            style: const TextStyle(  
              fontSize: 16,  
              fontWeight: FontWeight.bold,  
            ),  
          ),  
          Text(  
            subtitle,  
            style: const TextStyle(  
              fontSize: 14,  
              color: Colors.grey,  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
  
  // Method untuk membangun teks kanan dan ikon  
  Widget _buildRightTextAndIcon() {  
    return Row(  
      children: [  
        Text(  
          rightText,  
          style: const TextStyle(fontSize: 14),  
          textAlign: TextAlign.center,  
        ),  
        const SizedBox(width: 8),  
        const Icon(  
          Icons.arrow_forward_ios,  
          size: 20,  
        ),  
      ],  
    );  
  }  
}  
