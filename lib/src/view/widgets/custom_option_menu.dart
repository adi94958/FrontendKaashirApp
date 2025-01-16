import 'package:flutter/material.dart';  
  
class Option {  
  final String text;  
  final IconData icon;  
  final Color iconColor; // Tambahkan parameter warna  
  final VoidCallback onTap;  
  
  Option({  
    required this.text,  
    required this.icon,  
    required this.iconColor, // Tambahkan parameter warna  
    required this.onTap,  
  });  
}  
  
class CustomOptionMenu extends StatelessWidget {  
  final List<Option> options;  
  
  const CustomOptionMenu({  
    Key? key,  
    required this.options,  
  }) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    return Column(  
      mainAxisSize: MainAxisSize.min,  
      children: options.map((option) {  
        return ListTile(  
          leading: Icon(option.icon, color: option.iconColor), // Gunakan warna ikon  
          title: Text(option.text),  
          onTap: () {  
            option.onTap();  
            Navigator.of(context).pop(); // Menutup menu setelah memilih  
          },  
        );  
      }).toList(),  
    );  
  }  
}  