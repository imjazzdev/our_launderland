import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/admin/data_pengguna.dart';
import 'package:nakama_laundry/view/pages/admin/data_transaksi.dart';
import 'package:nakama_laundry/view/pages/admin/pesanan.dart';
import 'package:nakama_laundry/view/pages/login.dart';

import '../../../utils/color_pallete.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard Admin',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   'Dashboard Admin',
            //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataTransaksi(),
                        ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: ColorPallete.colorprimary,
                        // border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 3),
                              color: const Color.fromARGB(255, 80, 39, 176)
                                  .withOpacity(0.6),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/admin-transaksi.png',
                          height: 90,
                        ),
                        Text(
                          'Data Transaksi',
                          style: TextStyle(
                              fontSize: 16,
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
                          builder: (context) => DataPengguna(),
                        ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: ColorPallete.colorprimary,
                        // border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 3),
                              color: const Color.fromARGB(255, 80, 39, 176)
                                  .withOpacity(0.6),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/admin-data pengguna.png',
                          height: 90,
                        ),
                        Text(
                          'Data Pengguna',
                          style: TextStyle(
                              fontSize: 16,
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pesanan(),
                        ));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: ColorPallete.colorprimary,
                        // border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 3),
                              color: const Color.fromARGB(255, 80, 39, 176)
                                  .withOpacity(0.6),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/admin-pesanan.png',
                          height: 90,
                        ),
                        Text(
                          'Pesanan',
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
          ],
        ),
      )),
      bottomNavigationBar: InkWell(
        onTap: () {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.warning,
            title: 'Keluar dari Dashboard?',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false);
            },
          ).show();
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
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(15),
                color: Colors.red.shade400),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => Login(),
      //         ),
      //         (route) => false);
      //   },
      //   child: Icon(
      //     Icons.logout,
      //     size: 28,
      //   ),
      //   backgroundColor: Colors.red,
      // ),
    );
  }
}
