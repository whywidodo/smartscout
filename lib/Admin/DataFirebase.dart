import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';

class DataFirebase extends StatefulWidget {
  const DataFirebase({Key? key}) : super(key: key);

  @override
  _DataFirebaseState createState() => _DataFirebaseState();
}

class _DataFirebaseState extends State<DataFirebase> {
  final CollectionReference _kritik =
  FirebaseFirestore.instance.collection('kritiksaran');

  Future<void> _deleteProduct(String productId) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("Hapus Data"),
            content: const Text("Apakah anda yakin?"),
            actions: [
              TextButton(
                  onPressed: () async {
                    await _kritik.doc(productId).delete();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                        Text('Berhasil')));
                    Navigator.pop(context);
                  },
                  child: const Text('Ya')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tidak'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Data Kritik Saran", style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ warnaUngu, warnaPurple700, warnaPurple500],
            ),
          ),
        ),
        foregroundColor: warnaPutih,
        elevation: 1.0,
      ),
      body: StreamBuilder(
        stream: _kritik.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(2),
                  child: ListTile(
                    title: Text(documentSnapshot['kritik']),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(documentSnapshot['nama'].toString()),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProduct(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
