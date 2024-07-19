import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';



class AddPengaduanPage extends StatefulWidget {
  @override
  _AddPengaduanPageState createState() => _AddPengaduanPageState();
}

class _AddPengaduanPageState extends State<AddPengaduanPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _laporanController = TextEditingController();
  String? _noKtpPdfPath;
  String? _dokumenPdfPath;

  Future<void> _pickPdfFile(String type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        if (type == 'noktp') {
          _noKtpPdfPath = result.files.single.path;
        } else if (type == 'dokumen') {
          _dokumenPdfPath = result.files.single.path;
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Lakukan aksi pengiriman data di sini
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _noHpController,
                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor HP tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Nomor KTP (PDF)'),
                subtitle: Text(_noKtpPdfPath ?? 'No file selected'),
                trailing: ElevatedButton(
                  onPressed: () => _pickPdfFile('noktp'),
                  child: Text('Choose File'),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _laporanController,
                decoration: InputDecoration(
                  labelText: 'Laporan',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.report),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Laporan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Dokumen (PDF)'),
                subtitle: Text(_dokumenPdfPath ?? 'No file selected'),
                trailing: ElevatedButton(
                  onPressed: () => _pickPdfFile('dokumen'),
                  child: Text('Choose File'),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
