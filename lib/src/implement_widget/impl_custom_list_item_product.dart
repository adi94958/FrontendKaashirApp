import 'package:fe_kaashir/src/view/screens/sidebar.dart';
import 'package:flutter/material.dart';
import '../view/widgets/custom_list_item_product.dart'; // Import file ProductItem

class ImplCustomListItemProduct extends StatelessWidget {
  
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Laptop Gaming',
      'price': 15000000,
      'imageUrl': null,
    },
    {
      'title': 'Smartphone',
      'price': 7000000,
      'imageUrl': null, // Tidak ada gambar
    },
    {
      'title': 'Headset',
      'price': 300000,
      'imageUrl': null,
    },
    {
      'title': 'Mouse Wireless',
      'price': 150000,
      'imageUrl': null, // Tidak ada gambar
    },
    {
      'title': 'Laptop Gaming',
      'price': 15000000,
      'imageUrl': null,
    },
    {
      'title': 'Smartphone',
      'price': 7000000,
      'imageUrl': null, // Tidak ada gambar
    },
    {
      'title': 'Headset',
      'price': 300000,
      'imageUrl': null,
    },
    {
      'title': 'Mouse Wireless',
      'price': 150000,
      'imageUrl': null, // Tidak ada gambar
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Hitung jumlah kolom berdasarkan lebar layar
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 4 : 3;

    return Sidebar(
      title: 'Produk',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) {
            try {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CustomListItemProduct(
                    title: product['title'],
                    price: product['price'],
                    onTap: () {
                      print('Tap on ${product['title']}');
                      Navigator.pushNamed(context, '/implement-filter-form');
                    },
                  );
                },
              );
            } catch (e) {
              print('Error: $e');
              return Center(child: Text('An error occurred'));
            }
          },
        ),
      )
    );
  }
}

