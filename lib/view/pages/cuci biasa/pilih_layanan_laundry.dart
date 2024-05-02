import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/kiloan_bulanan.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/kiloan_daily.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/kiloan_express.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pesanan_anda.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

class PilihLayananLaundry extends StatefulWidget {
  const PilihLayananLaundry({super.key});

  @override
  State<PilihLayananLaundry> createState() => _PilihLayananLaundryState();
}

class _PilihLayananLaundryState extends State<PilihLayananLaundry> {
  int? _value = 1;
  List data = [
    {'layanan': '', 'harga': 0},
    {'layanan': 'Biasa - cuci setrika (3 hari)', 'harga': 7000},
    {'layanan': 'Express - cuci setrika (1 hari)', 'harga': 12000},
    {'layanan': 'Kilat - cuci setrika (6 jam)', 'harga': 20000},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih paket'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KiloanExpress(),
                  ));
            },
            child: ContainerDefault(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Kiloan Express',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // CircleAvatar(
                  //   radius: 12,
                  //   backgroundColor: Colors.white,
                  //   child: Radio(
                  //     value: 1,
                  //     groupValue: _value,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _value = value;
                  //       });
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KiloanDaily(),
                  ));
            },
            child: ContainerDefault(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Kiloan Daily',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   radius: 12,
                  //   child: Radio(
                  //     value: 2,
                  //     groupValue: _value,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _value = value;
                  //       });
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KiloanBulanan(),
                  ));
            },
            child: ContainerDefault(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Paket Bulanan',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // CircleAvatar(
                  //   radius: 12,
                  //   backgroundColor: Colors.white,
                  //   child: Radio(
                  //     value: 3,
                  //     groupValue: _value,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _value = value;
                  //       });
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: InkWell(
      //     onTap: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => PesananAnda(
      //                 layanan: data[_value!]['layanan'],
      //                 harga: data[_value!]['harga']),
      //           ));
      //     },
      //     child: OkeBottomNav())
    );
  }
}
