import 'package:flutter/material.dart';
import 'package:kejaksaanapp/customer/category/pengaduan/addPengaduan.dart';


class PengaduanPage extends StatelessWidget {
  final List<Map<String, String>> data = [
    {'judul': 'Pengaduan Pegawai 1', 'status': 'Pending'},
    {'judul': 'Pengaduan Pegawai 2', 'status': 'Approved'},
    {'judul': 'Pengaduan Pegawai 3', 'status': 'Rejected'},
    {'judul': 'Pengaduan Pegawai 4', 'status': 'Pending'},
    {'judul': 'Pengaduan Pegawai 5', 'status': 'Approved'},
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data List'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.report, color: getStatusColor(data[index]['status']!)),
              title: Text(data[index]['judul']!),
              subtitle: Text(data[index]['status']!, style: TextStyle(color: getStatusColor(data[index]['status']!))),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPengaduanPage()),
                );
          // Aksi saat tombol tambah ditekan
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tambah data baru')));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
