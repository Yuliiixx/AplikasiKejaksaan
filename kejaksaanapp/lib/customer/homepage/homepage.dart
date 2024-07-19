import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kejaksaanapp/customer/category/jms.dart';
import 'package:kejaksaanapp/customer/category/pengaduan/pengaduan.dart';
import 'package:kejaksaanapp/customer/category/pengawasan.dart';
import 'package:kejaksaanapp/customer/category/penyuluhan.dart';
import 'package:kejaksaanapp/customer/category/pidana.dart';
import 'package:kejaksaanapp/customer/category/pilkada.dart';
import 'package:kejaksaanapp/customer/menu/about.dart';
import 'package:kejaksaanapp/customer/menu/rating.dart';
import 'package:kejaksaanapp/profile/profile.dart';
import 'package:kejaksaanapp/widget/navbar.dart';
import 'package:kejaksaanapp/widget/menuItem.dart';

class HomePageCust extends StatefulWidget {
  @override
  _HomePageCustState createState() => _HomePageCustState();
}

class _HomePageCustState extends State<HomePageCust> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentPage < 3) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Nama Anda'),
              accountEmail: Text('email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile-picture.jpg'), // Ganti dengan path foto profil Anda
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Rating'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingPage()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gambar bergerak secara horizontal
          SizedBox(
            height: 200,
            child: PageView(
              controller: _pageController,
              children: [
                Image.asset('assets/images/1.png'),
                Image.asset('assets/images/2.png'),
                Image.asset('assets/images/3.png'),
                Image.asset('assets/images/4.png'),
              ],
            ),
          ),
          // Tanda bulat kecil
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  margin: EdgeInsets.all(5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == currentPage ? Colors.green : Colors.grey,
                  ),
                ),
            ],
          ),
          // Kotak menu
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              children: [
                MenuItem(
                  imagePath: 'assets/images/notif1.png',
                  text: 'Pengaduan Pegawai',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PengaduanPage()),
                    );
                  },
                ),
                MenuItem(
                  imagePath: 'assets/images/notif2.png',
                  text: 'Pengaduan Tindak Pidana Korupsi',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PidanaPage()),
                    );
                  },
                ),
                MenuItem(
                  imagePath: 'assets/images/notif3.png',
                  text: 'Penyuluhan Hukum',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PenyuluhanPage()),
                    );
                  },
                ),
                MenuItem(
                  imagePath: 'assets/images/notif4.png',
                  text: 'Jaksa Masuk Sekolah (JMS)',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => jmsPage()),
                    );
                  },
                ),
                MenuItem(
                  imagePath: 'assets/images/notif5.png',
                  text: 'Pengawasan Aliran dan Kepercayaan',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PengawasanPage()),
                    );
                  },
                ),
                MenuItem(
                  imagePath: 'assets/images/notif6.png',
                  text: 'Posko Pilkada',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PilkadaPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: HomePageCust(),
  ));
}
