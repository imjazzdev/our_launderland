import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pesanan_anda.dart';

import '../../widget/container_default.dart';
import '../../widget/oke_botom_nav.dart';

class KiloanExpress extends StatefulWidget {
  const KiloanExpress({super.key});

  @override
  State<KiloanExpress> createState() => _KiloanExpressState();
}

class _KiloanExpressState extends State<KiloanExpress> {
  int? _value = 1;

  // List<Map<String, dynamic>> data_menu = [
  //   {
  //     'title': 'Cuci Lipat Rapih /3kg',
  //     'menu': [
  //       'ABC',
  //       'DEF'
  //       // {'layanan': 'EXP 3 Jam', 'harga': '25000'},
  //       // {'layanan': 'EXP 6 Jam', 'harga': '21000'},
  //     ]
  //   },
  //   {
  //     'title': 'Cuci Lipat Rapih /5kg',
  //     'menu': [
  //       {'layanan': 'EXP 3 Jam', 'harga': '40000'},
  //       {'layanan': 'EXP 6 Jam', 'harga': '35000'},
  //     ]
  //   },
  //   {
  //     'title': 'Cuci Lipat Rapih /1kg',
  //     'menu': [
  //       {'layanan': 'EXP 8 Jam', 'harga': '12000'},
  //     ]
  //   },
  //   {
  //     'title': 'Setrika Rapih /1kg',
  //     'menu': [
  //       {'layanan': 'EXP 8 Jam', 'harga': '8000'},
  //     ]
  //   },
  // ];

  String? val_cuci_lipat_rapih_3kg = 'EXP 3 Jam';
  int hargaCLR3KG = 25000;
  int kilogramCLR3KG = 3;
  List cuci_lipat_rapih_3kg = [
    {'layanan': 'EXP 3 Jam', 'harga': 25000},
    {'layanan': 'EXP 6 Jam', 'harga': 21000},
  ];

  String? val_cuci_lipat_rapih_5kg = 'EXP 3 Jam';
  int kilogramCLR5KG = 5;
  int hargaCLR5KG = 40000;
  List cuci_lipat_rapih_5kg = [
    {'layanan': 'EXP 3 Jam', 'harga': 40000},
    {'layanan': 'EXP 6 Jam', 'harga': 35000},
  ];

  String? val_cuci_lipat_rapih_1kg = 'EXP 8 Jam';
  int kilogramCLR1KG = 1;
  int hargaCLR1KG = 12000;
  List cuci_lipat_rapih_1kg = [
    {'layanan': 'EXP 8 Jam', 'harga': 12000},
  ];

  String? val_setrika_rapih_1kg = 'EXP 8 Jam';
  int kilogramSR1KG = 1;
  int hargaSR1KG = 8000;
  List setrika_rapih_1kg = [
    {'layanan': 'EXP 8 Jam', 'harga': 8000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiloan Express'),
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
                        'Cuci Lipat Rapih /3kg',
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
                            value: val_cuci_lipat_rapih_3kg,
                            items: cuci_lipat_rapih_3kg
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
                                if (val.toString() == 'EXP 3 Jam') {
                                  val_cuci_lipat_rapih_3kg = 'EXP 3 Jam';
                                  hargaCLR3KG = 25000;
                                } else if (val.toString() == 'EXP 6 Jam') {
                                  val_cuci_lipat_rapih_3kg = 'EXP 6 Jam';
                                  hargaCLR3KG = 21000;
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
                                    kilogram: kilogramCLR3KG,
                                    jenis_layanan:
                                        'Express - Cuci Lipat Rapih /3kg',
                                    layanan:
                                        val_cuci_lipat_rapih_3kg.toString(),
                                    harga: hargaCLR3KG),
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
                        'Cuci Lipat Rapih /5kg',
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
                            value: val_cuci_lipat_rapih_5kg,
                            items: cuci_lipat_rapih_5kg
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
                                if (val.toString() == 'EXP 3 Jam') {
                                  val_cuci_lipat_rapih_5kg = 'EXP 3 Jam';
                                  hargaCLR5KG = 40000;
                                } else if (val.toString() == 'EXP 6 Jam') {
                                  val_cuci_lipat_rapih_5kg = 'EXP 6 Jam';
                                  hargaCLR5KG = 35000;
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
                                    kilogram: kilogramCLR5KG,
                                    jenis_layanan:
                                        'Express - Cuci Lipat Rapih /5kg',
                                    layanan:
                                        val_cuci_lipat_rapih_5kg.toString(),
                                    harga: hargaCLR5KG),
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
                        'Cuci Lipat Rapih /1kg',
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
                            value: val_cuci_lipat_rapih_1kg,
                            items: cuci_lipat_rapih_1kg
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
                                if (val.toString() == 'EXP 8 Jam') {
                                  val_cuci_lipat_rapih_1kg = 'EXP 8 Jam';
                                  hargaCLR1KG = 12000;
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
                                    kilogram: kilogramCLR1KG,
                                    jenis_layanan:
                                        'Express - Cuci Lipat Rapih /1kg',
                                    layanan:
                                        val_cuci_lipat_rapih_1kg.toString(),
                                    harga: hargaCLR1KG),
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
                        'Setrika Rapih /1kg',
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
                            value: val_setrika_rapih_1kg,
                            items: setrika_rapih_1kg
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
                                if (val.toString() == 'EXP 8 Jam') {
                                  val_setrika_rapih_1kg = 'EXP 8 Jam';
                                  hargaSR1KG = 8000;
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
                                    kilogram: kilogramSR1KG,
                                    jenis_layanan:
                                        'Express - Setrika Rapih /1kg',
                                    layanan: val_setrika_rapih_1kg.toString(),
                                    harga: hargaSR1KG),
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
      // bottomNavigationBar: InkWell(
      //     onTap: () {
      //       // Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(
      //       //       builder: (context) => PesananAnda(
      //       //           layanan: data[_value!]['layanan'],
      //       //           harga: data[_value!]['harga']),
      //       //     ));
      //     },
      //     child: OkeBottomNav())
    );
  }
}
