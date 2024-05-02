import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nakama_laundry/view/pages/admin/pesanan_detail.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';

import '../../../utils/color_pallete.dart';
import '../../widget/container_default.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pesanan'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                text: 'ANTRIAN',
              ),
              Tab(
                text: 'PROGRESS',
              ),
              Tab(
                text: 'DONE',
              ),
            ]),
          ),
          body: TabBarView(children: [Antree(), Progress(), Done()]),
          bottomNavigationBar: Container(
            // color: ColorPallete.colorprimary,
            height: 60,
            decoration: BoxDecoration(
                color: ColorPallete.colorprimary.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: ColorPallete.colorprimary.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 5)
                ]),
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            width: double.maxFinite,
            child: TextField(
              controller: VarGlobal.SEARCH_PESANAN_ADMIN,
              onSubmitted: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  // fillColor: ColorPallete.colorprimary.withOpacity(0.5),
                  // filled: true,
                  hintText: 'Search by name',
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                  border: InputBorder.none),
            ),
          ),
        ));
  }
}

class Antree extends StatelessWidget {
  const Antree({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Object?>> searchData() {
      if (VarGlobal.SEARCH_PESANAN_ADMIN.text == '') {
        return FirebaseFirestore.instance
            .collection('order')
            .where(
              'status',
              isEqualTo: 'ANTRIAN',
            )
            .snapshots();
      } else {
        return FirebaseFirestore.instance
            .collection('order')
            .where(
              'status',
              isEqualTo: 'ANTRIAN',
            )
            .where(
              'nama',
              isEqualTo: VarGlobal.SEARCH_PESANAN_ADMIN.text,
            )
            .snapshots();
      }
    }

    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: searchData(),
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
                                        '${snapshot.data!.docs[index]['jenis_layanan'].toString()}',
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
                                  IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          animType: AnimType.scale,
                                          dialogType: DialogType.warning,
                                          title: 'PROGRESS PESANAN?',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {
                                            updateStatus(
                                              snapshot
                                                  .data!
                                                  .docs[index]
                                                      ['waktu_pemesanan']
                                                  .toString(),
                                            );
                                          },
                                        ).show();
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.check,
                                          size: 35,
                                          color: Colors.green,
                                        ),
                                      ))
                                ],
                              )),
                        ));
              }
            }));
  }

  Future updateStatus(
    String id,
  ) async {
    print('ID INI: $id');
    final doc = FirebaseFirestore.instance.collection('order').doc(id);
    doc.update({'status': 'PROGRESS'});
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
     Stream<QuerySnapshot<Object?>> searchData() {
      if (VarGlobal.SEARCH_PESANAN_ADMIN.text == '') {
        return FirebaseFirestore.instance
            .collection('order')
            .where(
              'status',
              isEqualTo: 'PROGRESS',
            )
            .snapshots();
      } else {
        return FirebaseFirestore.instance
            .collection('order')
            .where(
              'status',
              isEqualTo: 'PROGRESS',
            )
            .where(
              'nama',
              isEqualTo: VarGlobal.SEARCH_PESANAN_ADMIN.text,
            )
            .snapshots();
      }
    }
    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: searchData(),
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
                                        snapshot
                                            .data!.docs[index]['jenis_layanan']
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
                                  IconButton(
                                      onPressed: () {
                                        AwesomeDialog(
                                          context: context,
                                          animType: AnimType.scale,
                                          dialogType: DialogType.warning,
                                          title: 'PESANAN SELESAI?',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {
                                            updateStatus(
                                              snapshot
                                                  .data!
                                                  .docs[index]
                                                      ['waktu_pemesanan']
                                                  .toString(),
                                            );
                                          },
                                        ).show();
                                      },
                                      icon: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.check,
                                          size: 35,
                                          color: Colors.green,
                                        ),
                                      ))
                                ],
                              )),
                        ));
              }
            }));
  }

  Future updateStatus(
    String id,
  ) async {
    final doc = FirebaseFirestore.instance.collection('order').doc(id);
    doc.update({'status': 'DONE'});
  }
}

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
     Stream<QuerySnapshot<Object?>> searchData() {
      if (VarGlobal.SEARCH_PESANAN_ADMIN.text == '') {
        return FirebaseFirestore.instance
            .collection('order')
            .where(
              'status',
              isEqualTo: 'DONE',
            )
            .snapshots();
      } else {
        return FirebaseFirestore.instance
            .collection('order')
            .where(
              'status',
              isEqualTo: 'DONE',
            )
            .where(
              'nama',
              isEqualTo: VarGlobal.SEARCH_PESANAN_ADMIN.text,
            )
            .snapshots();
      }
    }
    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: searchData(),
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
                                        snapshot
                                            .data!.docs[index]['jenis_layanan']
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
