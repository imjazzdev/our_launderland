import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/login.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   radius: 80,
            //   child: Icon(
            //     Icons.person,
            //     size: 80,
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              VarGlobal.USER_NOW,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                VarGlobal.USER_EMAIL_NOW,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Text(
              VarGlobal.USER_WA_NOW,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: Container(
                height: 80,
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  child: Text(
                    'Keluar',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red.shade400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
