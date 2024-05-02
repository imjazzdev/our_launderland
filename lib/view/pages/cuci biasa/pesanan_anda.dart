import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pilih_metode_pembayaran.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/color_pallete.dart';
import '../utils/varglobal.dart';

class PesananAnda extends StatefulWidget {
  final String jenis_layanan, layanan;

  final int harga;
  final int kilogram;
  final bool isKiloanBulanan;
  PesananAnda(
      {required this.jenis_layanan,
      required this.layanan,
      required this.harga,
      required this.kilogram,
      this.isKiloanBulanan = false});

  @override
  State<PesananAnda> createState() => _PesananAndaState();
}

class _PesananAndaState extends State<PesananAnda> {
  // TextEditingController tanggal = TextEditingController();
  // TextEditingController waktu = TextEditingController();
  TextEditingController alamat = TextEditingController();
  List list_parfum = ['Ocean Breeze', 'Philux', 'Gardenia', 'Downy'];
  String? valParfum;
  int kilogram = 1;
  bool clickSimpan = false;
  String? selectedDate;
  String? selectedTime;

  @override
  void initState() {
    VarGlobal.total_harga = widget.harga;
    kilogram = widget.kilogram;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('LAYANAN : ${widget.layanan}');
    print('HARGA : ${VarGlobal.total_harga}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan anda'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        ContainerDefault(
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.jenis_layanan,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.layanan,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Total Harga : Rp ${VarGlobal.total_harga}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'Kg',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.isKiloanBulanan
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              if (kilogram > 1) {
                                setState(() {
                                  kilogram = kilogram - widget.kilogram;
                                  VarGlobal.total_harga =
                                      VarGlobal.total_harga - widget.harga;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 25,
                            ),
                          ),
                    Container(
                      height: 30,
                      width: 50,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Text(kilogram.toString()),
                    ),
                    widget.isKiloanBulanan
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              setState(() {
                                kilogram = kilogram + widget.kilogram;
                                VarGlobal.total_harga =
                                    VarGlobal.total_harga + widget.harga;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 25,
                            ),
                          )
                  ],
                )
              ],
            )),
        const SizedBox(
          height: 20,
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
        SizedBox(
          height: 20,
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
        const SizedBox(
          height: 20,
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          alignment: Alignment.centerLeft,
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          height: 120,
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
      ]),
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
      jenis_layanan: widget.jenis_layanan,
      layanan: widget.layanan,
      harga: VarGlobal.total_harga.toString(),
      kilogram: kilogram.toString(),
      barang: [],
      parfum: valParfum!,
      waktu_pemesanan: DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()),
      waktu_pengambilan: '${selectedDate!} ${selectedTime!}',
      alamat: alamat.text,
      user: VarGlobal.USER_EMAIL_NOW,
      status: 'ANTRIAN',
    );
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
