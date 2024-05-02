import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pilih_layanan_laundry.dart';
import 'package:nakama_laundry/view/pages/cuci%20satuan/pilih_satuan_laundry.dart';
import 'package:nakama_laundry/view/pages/keranjang/keranjang.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/carousel_banner.dart';

import '../../utils/color_pallete.dart';
import 'harga/harga.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getInfo();

    super.initState();
  }

  Future getInfo() async {
    var user_kost = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.email ?? '')
        .get();
    VarGlobal.USER_NOW = user_kost['nama'] ?? 'Guest';
    VarGlobal.USER_WA_NOW = user_kost['no_telp'] ?? '';
    VarGlobal.USER_EMAIL_NOW =
        FirebaseAuth.instance.currentUser!.email.toString() ?? '';
    print('USER SAAT INI : ${VarGlobal.USER_NOW}');
    print('USER WA SAAT INI : ${VarGlobal.USER_WA_NOW}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('user')
                .doc(FirebaseAuth.instance.currentUser!.email ?? '')
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Hello, ${snapshot.data!.data()!['nama']}');
              } else {
                return SizedBox();
              }
            }),
        actions: [
          InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bantuan? hubungi customer service',
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Text(
                        '082122232572',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )
                    ],
                  ),
                  btnOkOnPress: () {},
                ).show();
              },
              child: Image.asset(
                'assets/menu-customer-service.png',
                width: 30,
              )),
          SizedBox(
            width: 15,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Keranjang(),
                    ));
              },
              child: Image.asset(
                'assets/menu-cart.png',
                width: 30,
              )),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(padding: EdgeInsets.only(bottom: 20), children: [
        CarouselBanner(),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Layanan Kami',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PilihLayananLaundry(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: ColorPallete.colorprimary.withOpacity(0.8),
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/menu-kiloan.png',
                      height: 90,
                    ),
                    Text(
                      'Cuci Kiloan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PilihSatuanLaundry(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: ColorPallete.colorprimary.withOpacity(0.8),
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/menu-satuan.png',
                      height: 90,
                    ),
                    Text(
                      'Cuci Satuan',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Harga(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: ColorPallete.colorprimary.withOpacity(0.8),
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/menu-harga.png',
                      height: 90,
                    ),
                    Text(
                      'Harga',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
