import 'package:flutter/material.dart';
import 'package:kejaksaanapp/customer/homepage/homepage.dart';
import 'package:kejaksaanapp/login/register.dart';
import 'package:kejaksaanapp/model/modelLogin.dart';
import 'package:kejaksaanapp/widget/apiUrl.dart';
import 'package:kejaksaanapp/widget/sessionManager.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var logger = Logger();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<ModelLogin?> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });

        http.Response res = await http.post(
          Uri.parse('${ApiUrl().baseUrl}auth.php'),
          body: {
            "login": "1",
            "email": txtEmail.text,
            "password": txtPassword.text,
          },
        );

        logger.d("Response status: ${res.statusCode}");
        logger.d("Response body: ${res.body}");

        if (res.statusCode == 200) {
          try {
            ModelLogin data = modelLoginFromJson(res.body);
            logger.d("data :: ${data.pesan}");

            if (data.sukses) {
              sessionManager.saveSession(
                data.sukses,
                data.data.id_user,
                data.data.nama,
                data.data.email,
                data.data.no_telpon,
                data.data.noktp,
                data.data.alamat,
                data.data.level,
              );
              sessionManager.getSession().then((value) {
                logger.d("email :: ${sessionManager.email}");
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${data.pesan}')),
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePageCust()),
                (route) => false,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${data.pesan}')),
              );
            }
          } catch (e) {
            logger.e("Error parsing JSON: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to parse response')),
            );
          }
        } else {
          logger.e("Failed to login. Status code: ${res.statusCode}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to login')),
          );
        }
      } catch (e) {
        logger.e("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset(
                'assets/images/logo.png', // Ganti dengan path gambar logo Anda
                height: 150,
                width: 150,
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: txtEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: txtPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : MaterialButton(
                        minWidth: 150,
                        height: 45,
                        onPressed: () {
                          login();
                        },
                        color: Colors.blue[900],
                        child: Text('Login', style: TextStyle(color: Colors.white)),
                      ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Belum punya akun? Silahkan daftar',
                  style: TextStyle(
                    color: Colors.blue[900],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
