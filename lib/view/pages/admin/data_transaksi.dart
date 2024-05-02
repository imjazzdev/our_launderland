import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/admin/pesanan_detail.dart';

import '../../widget/container_default.dart';

class DataTransaksi extends StatelessWidget {
  const DataTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Transaksi'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('order')
                .where(
                  'status',
                  isEqualTo: 'DONE',
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data!.size == 0) {
                return SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/data-kosong.png',
                        height: 60,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Belum ada data')
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PesananDetail(
                                    nama: snapshot.data!.docs[index]['nama'],
                                    layanan: snapshot.data!.docs[index]
                                        ['layanan'],
                                    harga: snapshot.data!.docs[index]['harga'],
                                    kilogram: snapshot.data!.docs[index]
                                        ['kilogram'],
                                    parfum: snapshot.data!.docs[index]
                                        ['parfum'],
                                    waktu_pemesanan: snapshot.data!.docs[index]
                                        ['waktu_pemesanan'],
                                    waktu_pengambilan: snapshot
                                        .data!.docs[index]['waktu_pengambilan'],
                                    alamat: snapshot.data!.docs[index]
                                        ['alamat'],
                                    barang: snapshot.data!.docs[index]
                                        ['barang'],
                                    status: snapshot.data!.docs[index]
                                        ['status'],
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]['nama']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['layanan']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                          snapshot.data!
                                              .docs[index]['waktu_pengambilan']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white))
                                    ],
                                  ),
                                ],
                              )),
                        ));
              }
            }));
  }
}
