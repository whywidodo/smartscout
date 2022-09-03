import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Registrasi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './Constant/Data.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var txtLoginEmail = TextEditingController();
  var txtLoginPassword = TextEditingController();

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
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: TextFormField(
                 controller: txtLoginEmail,
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
               padding: const EdgeInsets.all(15.0),
               child: TextFormField(
                 obscureText: true,
                 controller: txtLoginPassword,
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
             Container(
               height: 50,
               width: MediaQuery.of(context).size.width,
               padding: const EdgeInsets.only(left: 15.0, right: 15.0),
               child: TextButton(
                 style: TextButton.styleFrom(
                   backgroundColor: warnaUngu,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(0),
                       side: const BorderSide(color: warnaUngu)),
                 ),
                 onPressed: () {
                   _validateLogin();
                 },
                 child: Text(
                   "Login",
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
                   text: 'Belum memiliki akun? ',
                   style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                   children: [
                     TextSpan(
                       text: 'Registrasi sekarang',
                       style: TextStyle(color: warnaUngu, fontSize: ukFormTulisanKecil),
                       recognizer: TapGestureRecognizer()..onTap = () => _formRegistrasi()
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

  void _validateLogin() {
    print("Masuk proses ini");
    if(txtLoginEmail.text == "wahyu@gmail.com" && txtLoginPassword.text == "12345"){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Registrasi()),
              (route) => false);
    }else{
      Fluttertoast.showToast(
          msg: "Login gagal",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: warnaHitam,
          textColor: warnaPutih,
          fontSize: ukFormTulisanKecil
      );
    }
  }

  void _formRegistrasi() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Registrasi()), (route) => false);
  }
}
