import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../../widget/main_navigator.dart';
import '../home.dart';
import '../utils/varglobal.dart';

class DetailItemSatuanPakaianBerat extends StatefulWidget {
  const DetailItemSatuanPakaianBerat({super.key});

  @override
  State<DetailItemSatuanPakaianBerat> createState() =>
      _DetailItemSatuanPakaianBeratState();
}

class _DetailItemSatuanPakaianBeratState
    extends State<DetailItemSatuanPakaianBerat> {
  int _valueSelimut = 0;
  int _valueSeprai = 0;
  int _valueBantal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail item satuan pakaian berat'),
        actions: [
          Image.asset(
            'assets/add-to-cart.png',
            width: 40,
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/pakaian-Selimut.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Selimut',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueSelimut > 0) {
                              setState(() {
                                _valueSelimut--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(_valueSelimut.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueSelimut++;
                            });
                          },
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/pakaian-Seprai.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Seprai',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueSeprai > 0) {
                              setState(() {
                                _valueSeprai--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(_valueSeprai.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueSeprai++;
                            });
                          },
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/pakaian-Bantal.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Bantal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            if (_valueBantal > 0) {
                              setState(() {
                                _valueBantal--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(_valueBantal.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueBantal++;
                            });
                          },
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
            if (_valueSelimut != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Selimut',
                'qty': _valueSelimut,
                'harga': (_valueSelimut * 28000)
              });
            }
            if (_valueSeprai != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Seprai',
                'qty': _valueSeprai,
                'harga': (_valueSeprai * 38000)
              });
            }
            if (_valueBantal != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Bantal',
                'qty': _valueBantal,
                'harga': (_valueBantal * 8000)
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
          )),
    );
  }
}
