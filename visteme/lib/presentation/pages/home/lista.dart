import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  Lista({Key? key}) : super(key: key);

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final Stream<QuerySnapshot> blusas =
      FirebaseFirestore.instance.collection('blusas').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: blusas,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Cargando'),
              ],
            ));
          }
          final data = snapshot.requireData;
          return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Center(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 25,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart),
                          color: Colors.blue,
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 0,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            )),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${data.docs[index]['descripcion']}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'AmaticSC',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink)),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: Text('Color: ${data.docs[index]['color']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Kalam',
                                      fontSize: 18,
                                      color: Colors.black)),
                            ),
                            SizedBox(
                              child: Card(
                                  color: Colors.red,
                                  child: Image.network(
                                      '${data.docs[index]['image']}')),
                              height: 350,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Text(
                                  'Cantidad: ${data.docs[index]['cantidad']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Kalam',
                                      fontSize: 18,
                                      color: Colors.black)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 4),
                              child: Text('Talla: ${data.docs[index]['talla']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Kalam',
                                      fontSize: 18,
                                      color: Colors.black)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 4),
                              child: Text('Marca: ${data.docs[index]['marca']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Kalam',
                                      fontSize: 18,
                                      color: Colors.black)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 4),
                              child: Text(
                                  'Precio: ${data.docs[index]['precio']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Kalam',
                                      fontSize: 18,
                                      color: Colors.black)),
                            ),
                            const Divider(
                              height: 30,
                              color: Colors.brown,
                            ),
                          ]),
                    ],
                  ),
                );
              });
        });
  }
}
