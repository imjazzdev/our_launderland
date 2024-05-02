import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';

import 'pesanan_anda.dart';

class KiloanBulanan extends StatefulWidget {
  const KiloanBulanan({super.key});

  @override
  State<KiloanBulanan> createState() => _KiloanBulananState();
}

class _KiloanBulananState extends State<KiloanBulanan> {
  String? val_cuci_setrika_rapih = '20 Kg';
  int hargaCSR = 133000;
  List cuci_setrika_rapih = [
    {'layanan': '20 Kg', 'harga': 133000},
    {'layanan': '40 Kg', 'harga': 266000},
    {'layanan': '60 Kg', 'harga': 399000},
  ];

  String? val_setrika_rapih = '20 Kg';
  int hargaSR = 95000;
  List setrika_rapih = [
    {'layanan': '20 Kg', 'harga': 95000},
    {'layanan': '40 Kg', 'harga': 190000},
    {'layanan': '60 Kg', 'harga': 285000},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiloan Bulanan'),
      ),
      body: ListView(padding: EdgeInsets.only(top: 10), children: [
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
                              if (val.toString() == '20 Kg') {
                                val_cuci_setrika_rapih = '20 Kg';
                                hargaCSR = 133000;
                              } else if (val.toString() == '40 Kg') {
                                val_cuci_setrika_rapih = '40 Kg';
                                hargaCSR = 266000;
                              } else if (val.toString() == '60 Kg') {
                                val_cuci_setrika_rapih = '60 Kg';
                                hargaCSR = 399000;
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
                                kilogram: int.parse(
                                    val_cuci_setrika_rapih!.substring(0, 2)),
                                jenis_layanan: 'Bulanan - Cuci Setrika Rapih',
                                layanan: val_cuci_setrika_rapih.toString(),
                                harga: hargaCSR,
                                isKiloanBulanan: true,
                              ),
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
                              if (val.toString() == '20 Kg') {
                                val_setrika_rapih = '20 Kg';
                                hargaSR = 95000;
                              } else if (val.toString() == '40 Kg') {
                                val_setrika_rapih = '40 Kg';
                                hargaSR = 190000;
                              } else if (val.toString() == '60 Kg') {
                                val_setrika_rapih = '60 Kg';
                                hargaSR = 285000;
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
                                kilogram: int.parse(
                                    val_setrika_rapih!.substring(0, 2)),
                                jenis_layanan: 'Bulanan - Setrika Rapih',
                                layanan: val_setrika_rapih.toString(),
                                harga: hargaSR,
                                isKiloanBulanan: true,
                              ),
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
      ]),
    );
  }
}
