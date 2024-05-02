import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widget/container_default.dart';
import 'pesanan_anda.dart';

class KiloanDaily extends StatefulWidget {
  const KiloanDaily({super.key});

  @override
  State<KiloanDaily> createState() => _KiloanDailyState();
}

class _KiloanDailyState extends State<KiloanDaily> {
  String? val_cuci_setrika_rapih = '2 Hari';
  int hargaCSR = 7000;
  List cuci_setrika_rapih = [
    {'layanan': '2 Hari', 'harga': 7000},
    {'layanan': '1 Hari', 'harga': 8000},
  ];

  String? val_cuci_lipat_rapih = '2 Hari';
  int hargaCLR = 5000;
  List cuci_lipat_rapih = [
    {'layanan': '2 Hari', 'harga': 5000},
    {'layanan': '1 Hari', 'harga': 6000},
  ];

  String? val_setrika_rapih = '2 Hari';
  int hargaSR = 5000;
  List setrika_rapih = [
    {'layanan': '2 Hari', 'harga': 5000},
    {'layanan': '1 Hari', 'harga': 6000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiloan Daily'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          ContainerDefault(
            height: 90,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Cuci Setrika Rapih',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                        width: 170,
                        child: DropdownButton(
                            isExpanded: true,
                            value: val_cuci_setrika_rapih,
                            items: cuci_setrika_rapih
                                .map((e) => DropdownMenuItem(
                                      child: Text(
                                        '${e['layanan']}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: '${e['layanan']}',
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                if (val.toString() == '1 Hari') {
                                  val_cuci_setrika_rapih = '1 Hari';
                                  hargaCSR = 8000;
                                } else if (val.toString() == '2 Hari') {
                                  val_cuci_setrika_rapih = '2 Hari';
                                  hargaCSR = 7000;
                                }
                              });
                            }),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PesananAnda(
                                    kilogram: 1,
                                    jenis_layanan: 'Daily - Cuci Setrika Rapih',
                                    layanan: val_cuci_setrika_rapih.toString(),
                                    harga: hargaCSR),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 30,
                          color: Colors.white,
                        )))
              ],
            ),
          ),
          ContainerDefault(
            height: 90,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Cuci Lipat Rapih',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                        width: 170,
                        child: DropdownButton(
                            isExpanded: true,
                            value: val_cuci_lipat_rapih,
                            items: cuci_lipat_rapih
                                .map((e) => DropdownMenuItem(
                                      child: Text(
                                        '${e['layanan']}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: '${e['layanan']}',
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                if (val.toString() == '1 Hari') {
                                  val_cuci_lipat_rapih = '1 Hari';
                                  hargaCLR = 6000;
                                } else if (val.toString() == '2 Hari') {
                                  val_cuci_lipat_rapih = '2 Hari';
                                  hargaCLR = 5000;
                                }
                              });
                            }),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PesananAnda(
                                    kilogram: 1,
                                    jenis_layanan: 'Daily - Cuci Lipat Rapih',
                                    layanan: val_cuci_lipat_rapih.toString(),
                                    harga: hargaCLR),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 30,
                          color: Colors.white,
                        )))
              ],
            ),
          ),
          ContainerDefault(
            height: 90,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Setrika Rapih',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                        width: 170,
                        child: DropdownButton(
                            isExpanded: true,
                            value: val_setrika_rapih,
                            items: setrika_rapih
                                .map((e) => DropdownMenuItem(
                                      child: Text(
                                        '${e['layanan']}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: '${e['layanan']}',
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                if (val.toString() == '1 Hari') {
                                  val_setrika_rapih = '1 Hari';
                                  hargaSR = 6000;
                                } else if (val.toString() == '2 Hari') {
                                  val_setrika_rapih = '2 Hari';
                                  hargaSR = 5000;
                                }
                              });
                            }),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PesananAnda(
                                    kilogram: 1,
                                    jenis_layanan: 'Daily - Setrika Rapih',
                                    layanan: val_setrika_rapih.toString(),
                                    harga: hargaSR),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 30,
                          color: Colors.white,
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
