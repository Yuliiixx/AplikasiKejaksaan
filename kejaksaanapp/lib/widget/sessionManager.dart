import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  bool? value;
  String? id_user;
  String? nama;
  String? email;
  String? no_telpon;
  String? noktp;
  String? alamat;
  String? level;

  //simpan sesi
  Future<void> saveSession(bool val, String id_user, String nama, String email, String no_telpon, 
  String noktp, String alamat, String level ) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("sukses", val);
    pref.setString("id_user", id_user);
    pref.setString("nama", nama);
    pref.setString("email", email);
    pref.setString("no_telpon", no_telpon);
    pref.setString("noktp", noktp);
    pref.setString("alamat", alamat);
    pref.setString("level", level);
  }

  Future getSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getBool("sukses");
    id_user = pref.getString("id_user");
    nama = pref.getString("nama");
    email = pref.getString("email");
    no_telpon =  pref.getString("no_telpon");
    noktp = pref.getString("noktp");
    alamat = pref.getString("alamat");
    level = pref.getString("level");
  }
  //remove --> logout
  Future clearSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}

//instance class biar d panggil
SessionManager sessionManager = SessionManager();