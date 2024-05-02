import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/home.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  var nama = TextEditingController();
  var email = TextEditingController();
  var telp = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  bool isPasswordVisibile = true;
  bool isConfirmPwdVisibile = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Identitas Pengguna',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: nama,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  setState(() {
                    nama.text = value;
                  });
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  setState(() {
                    email.text = value;
                  });
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: telp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'No. Telpon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telpon tidak boleh kosong';
                  }
                  setState(() {
                    telp.text = value;
                  });
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: password,
                obscureText: isPasswordVisibile,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisibile = !isPasswordVisibile;
                          });
                        },
                        icon: Icon(isPasswordVisibile == true
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(),
                    hintText: '(min. 6 char)',
                    labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Minimal 6 character';
                  }

                  setState(() {
                    password.text = value;
                  });
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: confirmPassword,
                obscureText: isConfirmPwdVisibile,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isConfirmPwdVisibile = !isConfirmPwdVisibile;
                          });
                        },
                        icon: Icon(isConfirmPwdVisibile == true
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(),
                    labelText: 'Konfirmasi Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  }
                  setState(() {
                    confirmPassword.text = value;
                  });
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate() == true) {
            if (password.text == confirmPassword.text) {
              createUser();
              AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                body: const Center(
                  child: Text(
                    'Data Tersimpan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                btnOkOnPress: () {
                  Navigator.pop(context);
                },
              ).show();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Konfirmasi password salah!'),
                backgroundColor: Colors.orange.shade400,
              ));
            }
          }
        },
        child: OkeBottomNav(
          txt: 'DAFTAR',
        ),
      ),
    );
  }

  Future createUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    final doc = FirebaseFirestore.instance.collection('user').doc(email.text);
    final kost = User(
      nama: nama.text,
      email: email.text,
      telp: telp.text,
    );
    final json = kost.toJson();
    await doc.set(json);
  }
}

class User {
  final String nama, email, telp;

  User({
    required this.nama,
    required this.email,
    required this.telp,
  });

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'email': email,
        'no_telp': telp,
      };
}
