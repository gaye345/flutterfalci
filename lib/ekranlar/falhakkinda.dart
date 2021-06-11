import 'package:flutter/material.dart';
import '/sabitler.dart';

class Falhakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: falHakkindaRenk,
        title: Text('Fal Hakkında'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
                'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 203301111 numaralı Öğrenci Öğrenir tarafından 25 Haziran 2021 günü yapılmıştır'),
          ],
        ),
      ),
    );
  }
}
