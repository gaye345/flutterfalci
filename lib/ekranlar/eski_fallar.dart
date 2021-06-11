import 'package:flutter/material.dart';
import '/sabitler.dart';

class Eskifallar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eski Fallar'),
        backgroundColor: eskiFallarRenk,
      ),
    );
  }
}
