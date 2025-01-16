import 'package:flutter/material.dart';  
import 'custom_option_menu.dart'; // Pastikan ini adalah file yang benar  
  
class CustomListItem extends StatelessWidget {  
  final String title;  
  final String subtitle;  
  final String rightText;  
  final String? imageUrl;  
  final bool showImage;  
  final VoidCallback onEdit; // Parameter untuk edit  
  final VoidCallback onDelete; // Parameter untuk delete  
  
  const CustomListItem({  
    Key? key,  
    required this.title,  
    required this.subtitle,  
    required this.rightText,  
    this.imageUrl,  
    this.showImage = true,  
    required this.onEdit, // Tambahkan parameter ini  
    required this.onDelete, // Tambahkan parameter ini  
  }) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    return Padding(  
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),  
      child: Row(  
        crossAxisAlignment: CrossAxisAlignment.center,  
        children: [  
          // Kotak Foto (Opsional)  
          if (showImage)  
            Container(  
              width: 50,  
              height: 50,  
              decoration: BoxDecoration(  
                shape: BoxShape.circle,  
                color: Colors.grey[300],  
              ),  
              child: imageUrl != null && imageUrl!.isNotEmpty  
                  ? ClipOval(  
                      child: Image.network(  
                        imageUrl!,  
                        fit: BoxFit.cover,  
                        errorBuilder: (context, error, stackTrace) {  
                          return _buildInitials();  
                        },  
                      ),  
                    )  
                  : _buildInitials(),  
            ),  
          if (showImage) const SizedBox(width: 16), // Spasi jika ada foto  
  
          // Text Kiri (Judul dan Subjudul)  
          Expanded(  
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
          ),  
  
          // Text Kanan (Center Alignment)  
          Text(  
            rightText,  
            style: const TextStyle(fontSize: 14),  
            textAlign: TextAlign.center,  
          ),  
  
          // Popup Menu Button  
          PopupMenuButton<String>(  
            icon: const Icon(Icons.more_vert), 
            itemBuilder: (BuildContext context) {  
              return [  
                PopupMenuItem<String>(  
                  value: 'edit',  
                  child: CustomOptionMenu(  
                    options: [  
                      Option(  
                        text: 'Ubah',  
                        icon: Icons.edit,  
                        iconColor: Colors.black,  
                        onTap: () {  
                          onEdit(); // Panggil fungsi edit  
                        },  
                      ),  
                      Option(  
                        text: 'Hapus',  
                        icon: Icons.delete,  
                        iconColor: Colors.red,  
                        onTap: () {  
                          onDelete(); // Panggil fungsi delete  
                        },  
                      ),  
                    ],  
                  ),  
                ),  
              ];  
            },  
          ),  
        ],  
      ),  
    );  
  }  
  
  // Fungsi untuk menampilkan inisial  
  Widget _buildInitials() {  
    String initials = title.isNotEmpty  
        ? title.substring(0, title.length >= 2 ? 2 : 1).toUpperCase()  
        : '';  
    return Center(  
      child: Text(  
        initials,  
        style: const TextStyle(  
          fontSize: 16,  
          fontWeight: FontWeight.bold,  
          color: Colors.white,  
        ),  
      ),  
    );  
  }  
}  
