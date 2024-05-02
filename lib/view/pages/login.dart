import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/utils/color_pallete.dart';
import 'package:nakama_laundry/view/pages/admin/dashboard.dart';
import 'package:nakama_laundry/view/pages/lupa_password.dart';
import 'package:nakama_laundry/view/pages/register.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();
  bool isPwdVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.colorprimary,
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 300,
            child: Image.asset(
              'assets/logo-launderland.png',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, size: 28),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Email',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: password,
            obscureText: isPwdVisible,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 28),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPwdVisible = !isPwdVisible;
                      });
                    },
                    icon: Icon(isPwdVisible == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined)),
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step2(),
                        ));
                  },
                  child: Text(
                    'Lupa password?',
                    style: TextStyle(color: Colors.white),
                  ))),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              try {
                if (email.text == 'fauzanarundaya9@gmail.com') {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardAdmin(),
                      ),
                      (route) => false);
                } else {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text, password: password.text);
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigator(),
                      ),
                      (route) => false);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'wrong-password') {
                  setState(() {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.warning,
                      title: 'Email & password salah. Coba lagi',
                      btnOkOnPress: () {},
                    ).show();

                    email.clear();
                    password.clear();
                  });
                } else if (e.code == 'user-not-found') {
                  setState(() {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.error,
                      title: 'User tidak ditemukan. Coba lagi',
                      btnOkOnPress: () {},
                    ).show();

                    email.clear();
                    password.clear();
                  });
                } else {
                  print('HHFHHFJD');
                }
              } on Exception catch (e) {
                print('EXCEPTION: $e');
              }

              // if (email.text == 'admin') {
              //   Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => DashboardAdmin(),
              //       ),
              //       (route) => false);
              // } else {
              //   Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => MainNavigator(),
              //       ),
              //       (route) => false);
              // }
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tidak punya akun? ', style: TextStyle(color: Colors.white)),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                  },
                  child: Text(
                    'DAFTAR ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ],
          )
        ],
      )),
    );
  }
}
