import 'package:flutter/material.dart';
import 'ekranlar/profil.dart';
import 'islemler/Giris_yap.dart';
import 'ekranlar/bildirimler.dart';
import 'ekranlar/canli_fal.dart';
import 'ekranlar/falhakkinda.dart';
import 'ekranlar/gesture.dart';
import 'ekranlar/kahvefali.dart';
import 'ekranlar/mesajlar.dart';
import 'islemler/kayit_ol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => Bildirimler(),
        '/kahveFali': (context) => Eski2(),
        "/eskifallar": (context) => Mesajlar(),
        "/falHakkinda": (context) => Falhakkinda(),
        "/mesajlar": (context) => Mesajlar(),
        "/kahvefali": (context) => KahveFali(),
        '/girisYap': (context) => GirisYap(),
        "/kayitOl": (context) => KayitOl(),
        "/gesture": (context) => Gesture(),
        "/profil": (context)  => ProfilSayfa(),
      },
    );
  }
}
