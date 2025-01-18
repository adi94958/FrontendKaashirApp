import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart'; // Untuk format mata uang
import '../../widgets/custom_list_item.dart'; // Sesuaikan dengan lokasi file widget ini
import '../../widgets/custom_modal.dart'; // Sesuaikan dengan lokasi file widget ini
import '../sidebar.dart';
class DataProduk extends StatefulWidget {
  const DataProduk({Key? key}) : super(key: key);

  @override
  _DataProdukState createState() => _DataProdukState();
}

class _DataProdukState extends State<DataProduk> {
  // Dummy JSON data
  List<Map<String, dynamic>> items = [
    {"title": "Es Krim", "subtitle": "10000", "rightText": "200"},
    {"title": "Pudding", "subtitle": "5000", "rightText": "500"},
    {"title": "Bolu Susu", "subtitle": "15000", "rightText": "300"}
  ];

  // Fungsi untuk format angka ke mata uang Indonesia
  String formatCurrency(String amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(int.parse(amount));
  }

  // Fungsi untuk menambah item baru
  void _addItem(String title, String subtitle, String rightText) {
    setState(() {
      items.add({
        "title": title,
        "subtitle": subtitle,
        "rightText": rightText,
      });
    });
  }

  // Fungsi untuk mengedit item
  void _editItem(int index, String title, String subtitle, String rightText) {
    setState(() {
      items[index] = {
        "title": title,
        "subtitle": subtitle,
        "rightText": rightText,
      };
    });
  }

  // Fungsi untuk menghapus item
  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sidebar(
        title: 'Kelola Data Produk',
        child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300, // Atur tinggi
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CustomListItem(
                      title: item['title'],
                      subtitle: formatCurrency(item['subtitle']), // Format mata uang
                      rightText: 'Stok : ${item['rightText']}', // Tambahkan "Stok :"
                      imageUrl: null,
                      showImage: true,
                      onEdit: () {
                        _showEditModal(context, 'Edit ${item['title']}', item['title'], item['subtitle'], item['rightText'], index);
                      },
                      onDelete: () {
                        _showDeleteModal(context, 'Delete ${item['title']}', item['title'], index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Menambahkan item baru dengan data dummy
            _addItem("New Product", "1000", "100");
          },
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.black,
          shape: const CircleBorder(),
          elevation: 10, // Memberikan efek bayangan
        ),
      ),
    );
  }

  // Modal untuk edit item
  void _showEditModal(BuildContext context, String header, String itemName, String subtitle, String rightText, int index) {
    final titleController = TextEditingController(text: itemName);
    final subtitleController = TextEditingController(text: subtitle);
    final rightTextController = TextEditingController(text: rightText);

    showDialog(
      context: context,
      builder: (context) => CustomModal(
        header: header,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'New Name for $itemName'),
            ),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(labelText: 'New Price'),
            ),
            TextField(
              controller: rightTextController,
              decoration: InputDecoration(labelText: 'New Stock'),
            ),
          ],
        ),
        footerButtons: [
          ElevatedButton(
            onPressed: () {
              // Update item
              _editItem(index, titleController.text, subtitleController.text, rightTextController.text);
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

  // Modal untuk delete item
  void _showDeleteModal(BuildContext context, String header, String itemName, int index) {
    showDialog(
      context: context,
      builder: (context) => CustomModal(
        header: header,
        body: Text('Are you sure you want to delete $itemName?'),
        footerButtons: [
          ElevatedButton(
            onPressed: () {
              // Delete item
              _deleteItem(index);
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
