import 'package:flutter/material.dart';  
import 'package:fe_kaashir/src/implement_widget/impl_custom_modal.dart';  
import '../view/widgets/custom_list_item_navigation.dart';  
import '../view/widgets/custom_date_header.dart';  
import 'dart:convert'; // Untuk jsonDecode  
  
// Model untuk menyimpan data item  
class Item {  
  final String title;  
  final String subtitle;  
  final String rightText;  
  
  Item({  
    required this.title,  
    required this.subtitle,  
    required this.rightText,  
  });  
}  
  
// Model untuk menyimpan data tanggal  
class DateHeader {  
  final String date;  
  final String price;  
  final List<Item> items;  
  
  DateHeader({  
    required this.date,  
    required this.price,  
    required this.items,  
  });  
}  
  
class ImplCustomListItemNavigation extends StatelessWidget {  
  // Dummy JSON data  
  final String jsonData = '''  
  {  
    "report": [  
      {  
        "date": "02 Jan 2025",  
        "price": "Rp. 45.000",  
        "items": [  
          {  
            "title": "Nama Supplier 1",  
            "subtitle": "2025-01-02 13:46:00",  
            "rightText": "Rp 20.000"  
          },  
          {  
            "title": "Nama Supplier 2",  
            "subtitle": "2025-01-02 14:00:00",  
            "rightText": "Rp 25.000"  
          }  
        ]  
      },  
      {  
        "date": "03 Jan 2025",  
        "price": "Rp. 30.000",  
        "items": [  
          {  
            "title": "Nama Supplier 3",  
            "subtitle": "2025-01-03 14:00:00",  
            "rightText": "Rp 30.000"  
          }  
        ]  
      }  
    ]  
  }  
  ''';  
  
  @override  
  Widget build(BuildContext context) {  
    // Mengurai JSON  
    final Map<String, dynamic> parsedJson = jsonDecode(jsonData);  
    final List<DateHeader> dateHeaders = (parsedJson['report'] as List)  
        .map((data) => DateHeader(  
              date: data['date'],  
              price: data['price'],  
              items: (data['items'] as List)  
                  .map((item) => Item(  
                        title: item['title'],  
                        subtitle: item['subtitle'],  
                        rightText: item['rightText'],  
                      ))  
                  .toList(),  
            ))  
        .toList();  
  
    return MaterialApp(  
      home: Scaffold(  
        appBar: AppBar(title: const Text('Custom List Item Navigation Example')),  
        body: ListView.builder(  
          itemCount: dateHeaders.length,  
          itemBuilder: (context, index) {  
            return Column(  
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: [  
                CustomDateHeader(  
                  date: dateHeaders[index].date,  
                  price: dateHeaders[index].price,  
                ),  
                ...dateHeaders[index].items.map((item) {  
                  return CustomListItemNavigation(  
                    title: item.title,  
                    subtitle: item.subtitle,  
                    rightText: item.rightText,  
                    onTap: () {  
                      // Navigasi ke halaman detail  
                      Navigator.push(  
                        context,  
                        MaterialPageRoute(  
                          builder: (context) => ImplCustomModal(),  
                        ),  
                      );  
                    },  
                  );  
                }).toList(),  
              ],  
            );  
          },  
        ),  
      ),  
    );  
  }  
}  
