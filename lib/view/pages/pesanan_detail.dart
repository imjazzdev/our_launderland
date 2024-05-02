import 'package:flutter/material.dart';
import 'package:nakama_laundry/utils/color_pallete.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import 'cuci biasa/pilih_metode_pembayaran.dart';

class PesananDetail extends StatelessWidget {
  final String nama,
      layanan,
      harga,
      kilogram,
      parfum,
      waktu_pemesanan,
      waktu_pengambilan,
      status,
      alamat;
  final List barang;

  const PesananDetail(
      {super.key,
      required this.nama,
      required this.layanan,
      required this.harga,
      required this.kilogram,
      required this.status,
      required this.parfum,
      required this.waktu_pemesanan,
      required this.waktu_pengambilan,
      required this.barang,
      required this.alamat});

  @override
  Widget build(BuildContext context) {
    MaterialColor _status(status) {
      if (status == "ANTRIAN") {
        return Colors.red;
      } else if (status == "PROGRESS") {
        return Colors.amber;
      } else {
        return Colors.green;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan anda'),
      ),
      body: SizedBox(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  layanan,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: barang.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            barang[index]['barang'],
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(barang[index]['qty'].toString(),
                              style: TextStyle(color: Colors.white))),
                      Expanded(
                          flex: 1,
                          child: Text(barang[index]['harga'].toString(),
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('Total Harga : Rp ${harga}',
                    style: TextStyle(color: Colors.white)),
                Text('${kilogram} kg', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('Parfum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('${parfum}', style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('Waktu pengambilan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('${waktu_pengambilan}',
                    style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('Alamat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('${alamat}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('Status',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  color: _status(status),
                  child: Text('${status}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(),
                color: ColorPallete.colorprimary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      )),
      // bottomNavigationBar: InkWell(
      //     onTap: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const PilihMetodePembayaran(),
      //           ));
      //     },
      //     child: OkeBottomNav(txt: 'Bayar')),
    );
  }
}
