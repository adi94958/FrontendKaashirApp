import 'package:flutter/material.dart';
import '../view/screens/data_produk/data_produk.dart';
import '../implement_widget/impl_custom_modal.dart';
import '../implement_widget/impl_custom_list_item.dart';
import '../implement_widget/impl_custom_list_item_navigation.dart';

class AppRoutes {
  // Define route names as constants
  static const String dataKasir = '/data-kasir';
  static const String dataPelanggan = '/data-pelanggan';
  static const String arusKeuangan = '/arus-keuangan';
  static const String dataPenerimaZakat = '/data-penerima-zakat';
  static const String dataProduk = '/data-produk';
  static const String dataSupplier = '/data-supplier';
  static const String laporanPembelian = '/laporan-pembelian';
  static const String laporanPenjualan = '/laporan-penjualan';
  static const String laporanPersediaan = '/laporan-persediaan';
  static const String login = '/login';
  static const String pembayaranZakat = '/pembayaran-zakat';
  static const String pembelian = '/pembelian';
  static const String pengaturan = '/pengaturan';
  static const String register = '/register';
  static const String riwayatPenjualan = '/riwayat-penjualan';
  static const String transaksi = '/transaksi';
  static const String implementModal = '/implement-modal';
  static const String implementListItem = '/implement-list-item';

  // Define routes mapping
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      dataKasir: (context) => const DataProduk(),
      dataPelanggan: (context) => const DataProduk(),
      arusKeuangan: (context) => const DataProduk(),
      dataPenerimaZakat: (context) => const DataProduk(),
      dataProduk: (context) => const DataProduk(),
      dataSupplier: (context) => const DataProduk(),
      laporanPembelian: (context) => const DataProduk(),
      laporanPenjualan: (context) => const DataProduk(),
      laporanPersediaan: (context) => const DataProduk(),
      login: (context) => const DataProduk(),
      pembayaranZakat: (context) => const DataProduk(),
      pembelian: (context) => const DataProduk(),
      pengaturan: (context) => const DataProduk(),
      register: (context) => const DataProduk(),
      riwayatPenjualan: (context) => const DataProduk(),
      transaksi: (context) => const DataProduk(),
      implementModal: (context) => const ImplCustomModal(),
      implementListItem: (context) => const ImplCustomListItem(),
    };
  }
}
