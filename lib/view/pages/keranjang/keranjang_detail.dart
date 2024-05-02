import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nakama_laundry/utils/color_pallete.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:shimmer/shimmer.dart';

import '../../widget/oke_botom_nav.dart';
import '../cuci biasa/pilih_metode_pembayaran.dart';

class KeranjangDetail extends StatefulWidget {
  @override
  State<KeranjangDetail> createState() => _KeranjangDetailState();
}

class _KeranjangDetailState extends State<KeranjangDetail> {
  // final String layanan, harga, kilogram, tanggal, alamat, waktu;
  // TextEditingController tanggal = TextEditingController();
  // TextEditingController waktu = TextEditingController();
  TextEditingController alamat = TextEditingController();
  List list_parfum = ['Ocean Breeze', 'Philux', 'Gardenia', 'Downy'];
  String? valParfum;
  bool clickSimpan = false;
  String? selectedDate;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    print('TOTAL HARGA : ${VarGlobal.total_harga}');
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
                  'Satuan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: VarGlobal.list_keranjang.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child:
                              Text(VarGlobal.list_keranjang[index]['barang'])),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(VarGlobal.list_keranjang[index]['qty']
                                .toString()),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                              'Rp ${VarGlobal.list_keranjang[index]['harga'].toString()}')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Total Harga : Rp ${VarGlobal.total_harga}')),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(),
                color: ColorPallete.colorprimary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
          ContainerDefault(
            height: 60,
            child: DropdownButton(
                isExpanded: true,
                value: valParfum,
                hint: Text(
                  'Pilih parfum',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                underline: SizedBox(),
                items: list_parfum
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e.toString(),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    valParfum = val.toString();
                  });
                }),
          ),
          InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                animType: AnimType.rightSlide,
                title: 'Tanggal & Waktu',
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StatefulBuilder(builder: (context, setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tanggal',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        InkWell(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2099),
                            ).then((value) {
                              setState(() {
                                selectedDate =
                                    DateFormat('dd-MM-yyyy').format(value!);
                              });
                            });
                          },
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(selectedDate != null
                                    ? selectedDate!
                                    : 'Pilih tanggal pengambilan'),
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.blue,
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Waktu',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        InkWell(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (context, child) => MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child!),
                            ).then((value) {
                              setState(() {
                                selectedTime =
                                    '${value!.hour.toString().padLeft(2, '0')}:${value!.minute.toString().padLeft(2, '0')}';
                              });
                            });
                          },
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(selectedTime != null
                                    ? selectedTime!
                                    : 'Pilih waktu pengambilan'),
                                Icon(Icons.access_time, color: Colors.blue)
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  setState(() {});
                },
              ).show();

              // showDialog(
              //   context: context,
              //   builder: (context) => Dialog(
              //     shape: RoundedRectangleBorder(),
              //     child: StaefulBuilder(
              //       builder: (context) {
              //         return Container(
              //           height: 300,
              //           padding: EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: Colors.white),
              //           child: Column(
              //             children: [
              //               const Text(
              //                 'Tanggal',
              //                 style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.blue),
              //               ),
              //               InkWell(
              //                 onTap: () {
              //                   showDatePicker(
              //                     context: context,
              //                     initialDate: DateTime.now(),
              //                     firstDate: DateTime(2024),
              //                     lastDate: DateTime(2099),
              //                   ).then((value) {
              //                     setState(() {
              //                       selectedDate = value;
              //                     });
              //                   });
              //                 },
              //                 child: Container(
              //                   height: 40,
              //                   padding: EdgeInsets.only(left: 10, right: 10),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Text(selectedDate != null
              //                           ? selectedDate.toString()
              //                           : 'Pilih tanggal pengambilan'),
              //                       Icon(
              //                         Icons.calendar_month_outlined,
              //                         color: Colors.blue,
              //                       )
              //                     ],
              //                   ),
              //                   decoration: BoxDecoration(
              //                       border: Border.all(color: Colors.grey)),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       }
              //     ),
              //   ),
              // );
            },
            child: ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedDate != null
                      ? '${selectedDate!} - ${selectedTime!}'
                      : 'Tanggal dan waktu pengambilan'),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: alamat.text != ''
                ? Text('${alamat.text}')
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Masukan alamat anda'),
                      SizedBox(
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  animType: AnimType.rightSlide,
                                  title: 'Masukan alamat',
                                  body: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Alamat',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                        SizedBox(
                                            height: 130,
                                            child: TextField(
                                              maxLines: 5,
                                              controller: alamat,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                            )),
                                      ],
                                    ),
                                  ),
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    setState(() {});
                                  },
                                ).show();
                              },
                              child: const Text('Edit alamat')))
                    ],
                  ),
            decoration: BoxDecoration(
                border: Border.all(),
                color: ColorPallete.colorprimary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      )),
      bottomNavigationBar: clickSimpan == false
          ? InkWell(
              onTap: () {
                if (selectedDate == null ||
                    selectedTime == null ||
                    valParfum == null ||
                    alamat.text.isEmpty) {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.warning,
                    title: 'Mohon lengkapi data',
                    btnOkOnPress: () {},
                  ).show();
                } else {
                  addOrder();
                  setState(() {
                    clickSimpan = true;
                  });
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    title: 'Order disimpan,\nMohon lakukan pembayaran',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              child: OkeBottomNav(txt: 'Simpan'))
          : InkWell(
              onTap: () {
                VarGlobal.list_keranjang = [];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PilihMetodePembayaran(),
                    ));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Shimmer.fromColors(
                      highlightColor: Colors.white.withOpacity(0.5),
                      baseColor: ColorPallete.colorprimary,
                      child: OkeBottomNav(txt: '')),
                  Text(
                    'Bayar',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              )),
    );
  }

  Future addOrder() async {
    final doc = FirebaseFirestore.instance
        .collection('order')
        .doc('${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now())}');
    final order = Order(
        nama: VarGlobal.USER_NOW,
        jenis_layanan: 'Satuan',
        layanan: 'Satuan',
        harga: VarGlobal.total_harga.toString(),
        kilogram: '-',
        parfum: valParfum!,
        barang: VarGlobal.list_keranjang,
        waktu_pemesanan: DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()),
        waktu_pengambilan: '${selectedDate!} ${selectedTime!}',
        alamat: alamat.text,
        user: VarGlobal.USER_EMAIL_NOW,
        status: 'ANTRIAN');
    final json = order.toJson();
    await doc.set(json);
  }
}

class Order {
  final String nama,
      jenis_layanan,
      layanan,
      harga,
      kilogram,
      parfum,
      waktu_pemesanan,
      waktu_pengambilan,
      alamat,
      user,
      status;
  final List barang;

  Order(
      {required this.nama,
      required this.jenis_layanan,
      required this.layanan,
      required this.harga,
      required this.kilogram,
      required this.barang,
      required this.parfum,
      required this.waktu_pemesanan,
      required this.waktu_pengambilan,
      required this.status,
      required this.alamat,
      required this.user});

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'jenis_layanan': jenis_layanan,
        'layanan': layanan,
        'harga': harga,
        'kilogram': kilogram,
        'barang': barang,
        'parfum': parfum,
        'waktu_pemesanan': waktu_pemesanan,
        'waktu_pengambilan': waktu_pengambilan,
        'user': user,
        'alamat': alamat,
        'status': status,
      };
}
