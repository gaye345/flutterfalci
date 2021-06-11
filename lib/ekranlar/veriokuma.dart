import 'package:flutter/material.dart';
import '/models/albums.dart';
import '/models/getAlbum.dart';
import 'dart:math' as math;

import 'package:gizemli_falci/sabitler.dart';

class VeriOkuma extends StatefulWidget {
  @override
  _VeriOkumaState createState() => _VeriOkumaState();
}

class _VeriOkumaState extends State<VeriOkuma> {
  Future<List<Album>> album;

  @override
  void initState() {
    super.initState();
    album = getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('veri okuma işlemleri'),
        backgroundColor: veriOkumaRenk,
      ),
      body: FutureBuilder(
        future: album,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Album> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  child: ListTile(
                    leading: Icon(Icons.verified_user),
                    title: Text(data[index].id.toString()),
                    subtitle: Text(data[index].title),
                    trailing: Icon(Icons.arrow_right),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
