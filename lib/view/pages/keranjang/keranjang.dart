import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/keranjang/keranjang_detail.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../../widget/container_default.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: VarGlobal.list_keranjang.isEmpty
          ? Center(
              child: Text('Belum ada data'),
            )
          : ListView.builder(
              itemCount: VarGlobal.list_keranjang.length,
              itemBuilder: (context, index) => ContainerDefault(
                height: 60,
                padding: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        VarGlobal.list_keranjang[index]['qty'] == ''
                            ? SizedBox()
                            : Image.asset(
                                'assets/pakaian-${VarGlobal.list_keranjang[index]['gambar']}.png',
                                width: 30,
                              ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          VarGlobal.list_keranjang[index]['barang'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    VarGlobal.list_keranjang[index]['qty'] == ''
                        ? ElevatedButton(onPressed: () {}, child: Text('Batal'))
                        : Row(
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                                child: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _valueBantal--;
                                    // });
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
                                child: Text(
                                  VarGlobal.list_keranjang[index]['qty']
                                      .toString(),
                                ),
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                                child: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _valueBantal++;
                                    // });
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
            ),
      bottomNavigationBar: InkWell(
          onTap: () {
            hitungTotalHarga();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeranjangDetail(),
                ));
          },
          child: OkeBottomNav()),
    );
  }

  void hitungTotalHarga() async {
    for (var i = 0; i < VarGlobal.list_keranjang.length; i++) {
      VarGlobal.total_harga = VarGlobal.total_harga +
          int.parse(VarGlobal.list_keranjang[i]['harga'].toString());
      // print(int.parse(VarGlobal.list_keranjang[i]['harga'].toString()));
    }
  }
}
