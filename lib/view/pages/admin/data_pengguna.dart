import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nakama_laundry/utils/color_pallete.dart';

class DataPengguna extends StatefulWidget {
  const DataPengguna({super.key});

  @override
  State<DataPengguna> createState() => _DataPenggunaState();
}

class _DataPenggunaState extends State<DataPengguna> {
  var nama = TextEditingController();
  var noTelp = TextEditingController();
  var email = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pengguna'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('user').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data!.size == 0) {
              return SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/data-kosong.png',
                      height: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Belum ada data')
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(25),
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 30),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                          color: ColorPallete.colorprimary.withOpacity(0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.docs[index]['nama'].toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            snapshot.data!.docs[index]['no_telp'].toString(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            snapshot.data!.docs[index]['email'].toString(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: IconButton(
                          onPressed: () {
                            nama.text =
                                snapshot.data!.docs[index]['nama'].toString();
                            noTelp.text = snapshot.data!.docs[index]['no_telp']
                                .toString();
                            email.text =
                                snapshot.data!.docs[index]['email'].toString();

                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                insetPadding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  height: 360,
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text('Edit Data',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(
                                          color: ColorPallete.colorprimary
                                              .withOpacity(0.5),
                                          thickness: 1,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1, child: Text('Nama')),
                                          Expanded(
                                              flex: 5,
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  controller: nama,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1, child: Text('Telp')),
                                          Expanded(
                                              flex: 5,
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  controller: noTelp,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1, child: Text('Email')),
                                          Expanded(
                                              flex: 5,
                                              child: SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  controller: email,
                                                  readOnly: true,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          FirebaseFirestore.instance
                                              .collection('user')
                                              .doc(
                                                snapshot
                                                    .data!.docs[index]['email']
                                                    .toString(),
                                              )
                                              .update({
                                            'nama': nama.text,
                                            'no_telp': noTelp.text
                                          });

                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Oke',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorPallete.colorprimary),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
