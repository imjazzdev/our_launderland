import 'package:flutter/material.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';

import 'bayar_nanti.dart';
import 'bayar_sekarang.dart';

class PilihMetodePembayaran extends StatelessWidget {
  const PilihMetodePembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih metode pembayaran'),
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
                    'Bayar Sekarang',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BayarSekarang(),
                            ));
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded))
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
                    'Bayar Nanti',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BayarNanti(),
                            ));
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
