import 'package:flutter/material.dart';

class HargaSatuan extends StatelessWidget {
  const HargaSatuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar harga cuci satuan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          'assets/harga-satuan-launderland.png',
          height: double.maxFinite,
          width: double.maxFinite,
        ),
      ),
    );
  }
}
