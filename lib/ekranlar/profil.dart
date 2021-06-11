import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/sabitler.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final String mail = _auth.currentUser.email;

class ProfilSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: profilRenk,
      ),
      //body: Text(mail != null ? mail : 'Gayeportakaldali@gmail.com'),
    );
  }
}
