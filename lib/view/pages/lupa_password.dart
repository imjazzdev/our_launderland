import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/login.dart';

class LupaPassword extends StatelessWidget {
  const LupaPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Lupa Kata Sandi?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Jangan khawatir akun anda tetap aman.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Dapatkan kode melalui',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Step2(),
                            ));
                      },
                      child: Text('Email')))
            ],
          ),
        ));
  }
}

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Masukan Email Anda',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Masukkan alamat email untuk mereset password',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'kode akan dikirim ke email dalam 5 menit ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Check your email')));
                      } on FirebaseAuthException catch (err) {
                        throw Exception(err.message.toString());
                      } catch (err) {
                        throw Exception(err.toString());
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Step3(),
                      //     ));
                    },
                    child: Text('Kirim')))
          ],
        ),
      ),
    );
  }
}

class Step3 extends StatelessWidget {
  const Step3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Masukan Code',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Kode telah dikirim ke alamat email',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'suriyani050423@gmail.com',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step4(),
                        ));
                  },
                  child: Text(
                    'kirim ulang?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('VERIFIKASI CODE')))
          ],
        ),
      ),
    );
  }
}

class Step4 extends StatelessWidget {
  const Step4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Masukan Kata Sandi Baru',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Masukkan Kata sandi baru anda',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Konfirmasi Kata sandi baru anda',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                          (route) => false);
                    },
                    child: Text('KONFIRMASI')))
          ],
        ),
      ),
    );
  }
}
