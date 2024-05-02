import 'package:flutter/material.dart';
import 'package:nakama_laundry/utils/color_pallete.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/varglobal.dart';

class BayarSekarang extends StatefulWidget {
  @override
  State<BayarSekarang> createState() => _BayarSekarangState();
}

class _BayarSekarangState extends State<BayarSekarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainNavigator(),
                  ),
                  (route) => false);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Pembayaran melalui Qris'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/qris-pembayaran.jpeg',
              height: 250,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Harga : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  'Rp${VarGlobal.total_harga}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: ColorPallete.colorprimary),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'silahkan scanbarcode diatas untuk melakukan pembayaran',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text('kirim bukti pembayaran ke whatsapp ini'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!await launchUrl(
                    Uri.parse('https://wa.me/6282122232572'))) {
                  throw Exception('Ada masalah');
                }
              },
              child: Text('+62 821-2223-2572'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 236, 96)),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainNavigator(),
                    ),
                    (route) => false);
              },
              child: Text(
                'Kembali ke Beranda',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.colorprimary),
            )
          ],
        ),
      ),
    );
  }
}
