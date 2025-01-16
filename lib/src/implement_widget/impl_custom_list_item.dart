import 'package:flutter/material.dart';  
import 'dart:convert'; // Untuk jsonDecode  
import '../view/widgets/custom_list_item.dart'; // Sesuaikan dengan lokasi file widget ini  
import '../view/widgets/custom_modal.dart'; // Sesuaikan dengan lokasi file widget ini  
  
class ImplCustomListItem extends StatelessWidget {  
  const ImplCustomListItem({Key? key}) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    // Dummy JSON data  
    String jsonData = '''  
    [  
      {"title": "Es Krim", "subtitle": "Rp. 10.000", "rightText": "1x"},  
      {"title": "Pudding", "subtitle": "Rp. 5.000", "rightText": "1x"},  
      {"title": "Es Krim", "subtitle": "Rp. 10.000", "rightText": "Stok: 500"}  
    ]  
    ''';  
  
    // Mengurai JSON menjadi List<Map<String, dynamic>>  
    List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(jsonDecode(jsonData));  
  
    return MaterialApp(  
      home: Scaffold(  
        appBar: AppBar(title: const Text('Custom List Item Example')),  
        body: SingleChildScrollView(  
          child: Column(  
            children: [  
              // Contoh Penggunaan 1 List Item dengan kotak foto  
              CustomListItem(  
                title: 'Es Krim',  
                subtitle: 'Rp. 10.000',  
                rightText: '1x',  
                imageUrl: null,  
                showImage: true,  
                onEdit: () {  
                  _showEditModal(context, 'Edit Item 1', 'Es Krim');  
                },  
                onDelete: () {  
                  _showDeleteModal(context, 'Delete Item 1', 'Es Krim');  
                },  
              ),  
              // Contoh Penggunaan 2 List Item tanpa kotak foto  
              CustomListItem(  
                title: 'Pudding',  
                subtitle: 'Rp. 5.000',  
                rightText: '1x',  
                imageUrl: null,  
                showImage: false,  
                onEdit: () {  
                  _showEditModal(context, 'Edit Item 2', 'Pudding');  
                },  
                onDelete: () {  
                  _showDeleteModal(context, 'Delete Item 2', 'Pudding');  
                },  
              ),  
              // Contoh Penggunaan 3 List Item dengan data array dari JSON  
              SizedBox(  
                height: 300, // Atur tinggi  
                child: ListView.builder(  
                  shrinkWrap: true,  
                  itemCount: items.length,  
                  itemBuilder: (context, index) {  
                    final item = items[index];  
                    return CustomListItem(  
                      title: item['title'],  
                      subtitle: item['subtitle'],  
                      rightText: item['rightText'],  
                      imageUrl: null,  
                      showImage: true,  
                      onEdit: () {  
                        _showEditModal(context, 'Edit ${item['title']}', item['title']);  
                      },  
                      onDelete: () {  
                        _showDeleteModal(context, 'Delete ${item['title']}', item['title']);  
                      },  
                    );  
                  },  
                ),  
              ),  
            ],  
          ),  
        ),  
      ),  
    );  
  }  
  
  void _showEditModal(BuildContext context, String header, String itemName) {  
    showDialog(  
      context: context,  
      builder: (context) => CustomModal(  
        header: header,  
        body: Column(  
          mainAxisSize: MainAxisSize.min,  
          children: [  
            TextField(  
              decoration: InputDecoration(labelText: 'New Name for $itemName'),  
            ),  
            TextField(  
              decoration: InputDecoration(labelText: 'New Price'),  
            ),  
          ],  
        ),  
        footerButtons: [  
          ElevatedButton(  
            onPressed: () {  
              // Logika untuk menyimpan perubahan  
              print('Item $itemName edited');  
              Navigator.of(context).pop();  
            },  
            child: const Text('Save'),  
          ),  
          TextButton(  
            onPressed: () => Navigator.of(context).pop(),  
            child: const Text('Cancel'),  
          ),  
        ],  
      ),  
    );  
  }  
  
  void _showDeleteModal(BuildContext context, String header, String itemName) {  
    showDialog(  
      context: context,  
      builder: (context) => CustomModal(  
        header: header,  
        body: Text('Are you sure you want to delete $itemName?'),  
        footerButtons: [  
          ElevatedButton(  
            onPressed: () {  
              // Logika untuk menghapus item  
              print('Item $itemName deleted');  
              Navigator.of(context).pop();  
            },  
            child: const Text('Delete'),  
          ),  
          TextButton(  
            onPressed: () => Navigator.of(context).pop(),  
            child: const Text('Cancel'),  
          ),  
        ],  
      ),  
    );  
  }  
}  
