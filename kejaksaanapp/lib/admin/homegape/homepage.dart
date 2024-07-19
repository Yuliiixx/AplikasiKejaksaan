import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kejaksaanapp/admin/category/jms.dart';
import 'package:kejaksaanapp/admin/category/pengaduan.dart';
import 'package:kejaksaanapp/admin/category/pengawasan.dart';
import 'package:kejaksaanapp/admin/category/penyuluhan.dart';
import 'package:kejaksaanapp/admin/category/pidana.dart';
import 'package:kejaksaanapp/admin/category/pilkada.dart';
import 'package:kejaksaanapp/widget/menuItem.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
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

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(4, (int index) {
        return Container(
          margin: EdgeInsets.all(5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentPage ? Colors.green : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Expanded(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
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
          _buildPageIndicator(),
          // Kotak menu
          _buildMenuItems(context),
        ],
      ),
    );
  }
}
