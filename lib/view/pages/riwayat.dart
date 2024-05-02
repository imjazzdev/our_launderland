import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pesanan_anda.dart';
import 'package:nakama_laundry/view/pages/pesanan_detail.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat pesanan'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('order')
            .where(
              'user',
              isEqualTo: VarGlobal.USER_EMAIL_NOW,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                padding: EdgeInsets.only(top: 20),
                children: snapshot.data!.docs
                    .map((e) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PesananDetail(
                                    nama: e['nama'],
                                    layanan: e['layanan'],
                                    harga: e['harga'],
                                    kilogram: e['kilogram'],
                                    parfum: e['parfum'],
                                    waktu_pemesanan: e['waktu_pemesanan'],
                                    waktu_pengambilan: e['waktu_pengambilan'],
                                    alamat: e['alamat'],
                                    barang: e['barang'],
                                    status: e['status'],
                                  ),
                                ));
                          },
                          child: ContainerDefault(
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['jenis_layanan'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      e['layanan'] != 'Satuan'
                                          ? Text(
                                              e['layanan'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          : SizedBox(),
                                      Text(e['waktu_pengambilan'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white))
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          animType: AnimType.scale,
                                          dialogType: DialogType.warning,
                                          title: 'Menghapus pesanan?',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {
                                            FirebaseFirestore.instance
                                                .collection('order')
                                                .doc(e['waktu_pemesanan'])
                                                .delete();
                                          },
                                        ).show();
                                      },
                                      icon: Icon(
                                        Icons.delete_forever,
                                        size: 35,
                                        color: Colors.red,
                                      ))
                                ],
                              )),
                        ))
                    .toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
