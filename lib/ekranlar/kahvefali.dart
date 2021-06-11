import 'package:flutter/material.dart';
import '/sabitler.dart';


class KahveFali extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kahve Falı'),
        backgroundColor: kahveFaliRenk,
      ),
    );
  }
}