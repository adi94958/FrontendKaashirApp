import 'package:flutter/material.dart';
import 'package:fe_kaashir/src/view/widgets/custom_searchbar.dart';

class ImplCustomSearchBar extends StatefulWidget {
  const ImplCustomSearchBar({Key? key}) : super(key: key);

  @override
  _ImplSearchBarState createState() => _ImplSearchBarState();
}

class _ImplSearchBarState extends State<ImplCustomSearchBar> {
  List<String> _data = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Heidi',
    'Ivan',
    'Judy',
  ]; // Daftar data statis
  List<String> _filteredData = []; // Daftar hasil pencarian

  @override
  void initState() {
    super.initState();
    _filteredData = _data; // Awalnya, hasil pencarian sama dengan data
  }

  void _onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredData = _data; // Jika input kosong, tampilkan semua data
      } else {
        _filteredData = _data
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList(); // Filter data berdasarkan input
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo Custom Search Bar"),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            onSearch: _onSearch, // Mengatur callback pencarian
            placeholder: 'Masukkan nama...', // Mengatur placeholder
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(_filteredData[index]), // Menampilkan hasil pencarian
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
