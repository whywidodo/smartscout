import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './Constant/Data.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  var txtRegEmail = TextEditingController();
  var txtRegPassword = TextEditingController();
  var txtRegPassword2 = TextEditingController();
  var txtRegUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/images/smartscout.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                child: TextFormField(
                  controller: txtRegUser,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Nama Lengkap',
                    hintText: 'Masukkan nama lengkap Anda',
                    hintStyle: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                    labelStyle: const TextStyle(color: warnaUngu),
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      color: warnaUngu,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: warnaUngu, width: 1.1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                      const BorderSide(color: warnaUngu),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                child: TextFormField(
                  controller: txtRegEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Masukkan email Anda',
                    hintStyle: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                    labelStyle: const TextStyle(color: warnaUngu),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: warnaUngu,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: warnaUngu, width: 1.1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                      const BorderSide(color: warnaUngu),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                child: TextFormField(
                  obscureText: true,
                  controller: txtRegPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukkan password Anda',
                    hintStyle: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                    labelStyle: const TextStyle(color: warnaUngu),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: warnaUngu,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: warnaUngu, width: 1.1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                      const BorderSide(color: warnaUngu),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                child: TextFormField(
                  obscureText: true,
                  controller: txtRegPassword2,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Ulangi Password',
                    hintText: 'Ulangi password Anda',
                    hintStyle: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                    labelStyle: const TextStyle(color: warnaUngu),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: warnaUngu,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: warnaUngu, width: 1.1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                      const BorderSide(color: warnaUngu),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: warnaUngu,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: const BorderSide(color: warnaUngu)),
                  ),
                  onPressed: () {
                    _validateRegistrasi();
                  },
                  child: Text(
                    "Registrasi",
                    style: TextStyle(
                      fontSize: ukFormTulisanSedang,
                      fontFamily: 'PoppinsMedium',
                      color: warnaPutih,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Sudah memiliki akun? ',
                    style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                    children: [
                      TextSpan(
                          text: 'Login sekarang',
                          style: TextStyle(color: warnaUngu, fontSize: ukFormTulisanKecil),
                          recognizer: TapGestureRecognizer()..onTap = () => _formLogin()
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _validateRegistrasi() {
    if(txtRegPassword.text == txtRegPassword2.text){
      if(txtRegEmail.text != ""){
        Fluttertoast.showToast(
            msg: "Registrasi berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: warnaHitam,
            textColor: warnaPutih,
            fontSize: ukFormTulisanKecil
        );
      }
    }else{
      print("Password yang dimasukan tidak sama");
    }
  }

  void _formLogin(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Login()), (route) => false);
  }

}
