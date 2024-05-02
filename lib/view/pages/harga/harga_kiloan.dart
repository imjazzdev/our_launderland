import 'package:flutter/material.dart';

class HargaKiloan extends StatelessWidget {
  const HargaKiloan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar harga cuci kiloan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          'assets/harga-kiloan-launderland.png',
          height: double.maxFinite,
          width: double.maxFinite,
        ),
      ),
    );
  }
}
