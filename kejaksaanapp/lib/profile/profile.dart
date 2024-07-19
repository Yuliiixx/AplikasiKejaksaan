import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'), // Menggunakan gambar dari asset
              ),
            ),
            SizedBox(height: 20),
            _buildProfileInfo(Icons.person, 'Nama', 'Nama Anda'),
            _buildProfileInfo(Icons.email, 'Email', 'email@example.com'),
            _buildProfileInfo(Icons.phone, 'No HP', '+628123456789'),
            _buildProfileInfo(Icons.credit_card, 'No KTP', '1234567890123456'),
            _buildProfileInfo(Icons.home, 'Alamat', 'Alamat Anda'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(IconData icon, String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              info,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
