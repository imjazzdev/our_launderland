import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../../widget/main_navigator.dart';
import '../home.dart';
import '../utils/varglobal.dart';

class DetailItemSatuanHousehold extends StatefulWidget {
  const DetailItemSatuanHousehold({super.key});

  @override
  State<DetailItemSatuanHousehold> createState() =>
      _DetailItemSatuanHouseholdState();
}

class _DetailItemSatuanHouseholdState extends State<DetailItemSatuanHousehold> {
  int _valueSelimutTipis = 0;
  int _valueSelimutTebal = 0;
  int _valueBedCoverSingle = 0;
  int _valueBedCoverDouble = 0;
  int _valueBedCoverKing = 0;
  int _valueKeset = 0;
  int _valueGordenTipis = 0;
  int _valueGordenTebal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail item satuan household'),
        // actions: [
        //   Image.asset(
        //     'assets/add-to-cart.png',
        //     width: 40,
        //   ),
        //   SizedBox(
        //     width: 5,
        //   )
        // ],
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Selimut.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Selimut Tipis',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueSelimutTipis > 0) {
                              setState(() {
                                _valueSelimutTipis--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueSelimutTipis.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueSelimutTipis++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Selimut.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Selimut Tebal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueSelimutTebal > 0) {
                              setState(() {
                                _valueSelimutTebal--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueSelimutTebal.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueSelimutTebal++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Bed.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Bed Cover Single',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueBedCoverSingle > 0) {
                              setState(() {
                                _valueBedCoverSingle--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueBedCoverSingle.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueBedCoverSingle++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Bed.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Bed Cover Double',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueBedCoverDouble > 0) {
                              setState(() {
                                _valueBedCoverDouble--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueBedCoverDouble.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueBedCoverDouble++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Bed.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Bed Cover King',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueBedCoverKing > 0) {
                              setState(() {
                                _valueBedCoverKing--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueBedCoverKing.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueBedCoverKing++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Keset.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Keset',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueKeset > 0) {
                              setState(() {
                                _valueKeset--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueKeset.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueKeset++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Gorden.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gorden Tipis /m2',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueGordenTipis > 0) {
                              setState(() {
                                _valueGordenTipis--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueGordenTipis.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueGordenTipis++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              padding: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pakaian-Gorden.png',
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gorden Tebal /m2',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueGordenTebal > 0) {
                              setState(() {
                                _valueGordenTebal--;
                              });
                            }
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(_valueGordenTebal.toString()),
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueGordenTebal++;
                            });
                          },
                          iconSize: 20,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            if (_valueSelimutTipis != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Selimut Tipis',
                'gambar': 'Selimut',
                'qty': _valueSelimutTipis,
                'harga': (_valueSelimutTipis * 10000)
              });
            }
            if (_valueSelimutTebal != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Selimut Tebal',
                'gambar': 'Selimut',
                'qty': _valueSelimutTebal,
                'harga': (_valueSelimutTebal * 15000)
              });
            }
            if (_valueBedCoverSingle != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Bed Cover Single',
                'gambar': 'Bed',
                'qty': _valueBedCoverSingle,
                'harga': (_valueBedCoverSingle * 20000)
              });
            }
            if (_valueBedCoverDouble != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Bed Cover Double',
                'gambar': 'Bed',
                'qty': _valueBedCoverDouble,
                'harga': (_valueBedCoverDouble * 25000)
              });
            }
            if (_valueBedCoverKing != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Bed Cover King',
                'gambar': 'Bed',
                'qty': _valueBedCoverKing,
                'harga': (_valueBedCoverKing * 30000)
              });
            }
            if (_valueKeset != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Keset',
                'gambar': 'Keset',
                'qty': _valueKeset,
                'harga': (_valueKeset * 10000)
              });
            }
            if (_valueGordenTipis != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Gorden Tipis',
                'gambar': 'Gorden',
                'qty': _valueGordenTipis,
                'harga': (_valueGordenTipis * 5000)
              });
            }
            if (_valueGordenTebal != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Gorden Tebal',
                'gambar': 'Gorden',
                'qty': _valueGordenTebal,
                'harga': (_valueGordenTebal * 8000)
              });
            }
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              title: 'Berhasil memasukan ke keranjang',
              btnOkOnPress: () {
                Navigator.pop(context);
              },
            ).show();
            print(VarGlobal.list_keranjang);
          },
          child: OkeBottomNav(
            txt: 'Masuk Keranjang',
            margin: 10,
          )),
    );
  }
}
