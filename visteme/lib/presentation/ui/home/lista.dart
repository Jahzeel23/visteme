/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  Lista({Key? key}) : super(key: key);

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Cargando');
          }
          final data = snapshot.requireData;
          return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Column(children: [
                  Container(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/images/logovisteme.jpg')),
                  Text(
                      'My name is ${data.docs[index]['name']}  and My job is: ${data.docs[index]['job']}'),
                ]);
              });
        });
  }
}*/
