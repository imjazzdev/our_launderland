import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../home.dart';
import '../utils/varglobal.dart';

class LayananTambahan extends StatefulWidget {
  const LayananTambahan({super.key});

  @override
  State<LayananTambahan> createState() => _LayananTambahanState();
}

class _LayananTambahanState extends State<LayananTambahan> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih layanan tambahan'),
        actions: [
          Image.asset(
            'assets/add-to-cart.png',
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
                  Text(
                    'Layanan Lipat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
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
                  Text(
                    'Layanan Setrika',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            if (_value == 1) {
              VarGlobal.list_keranjang
                  .add({'barang': 'Layanan Lipat', 'qty': '', 'harga': 2000});
            }
            if (_value == 2) {
              VarGlobal.list_keranjang
                  .add({'barang': 'Layanan Setrika', 'qty': '', 'harga': 4000});
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
