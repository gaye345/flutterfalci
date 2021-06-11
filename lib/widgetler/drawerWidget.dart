import 'package:flutter/material.dart';
import '/ekranlar/animasyon_grafik.dart';
import '/ekranlar/eski_fallar.dart';
import '/ekranlar/falhakkinda.dart';
import '/ekranlar/gesture.dart';
import '/ekranlar/mesajlar.dart';
import '/ekranlar/profil.dart';
import '/ekranlar/veriokuma.dart';
import '/ekranlar/yeniWidgetler.dart';
import '/islemler/kayit_ol.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: ListView(
        children: [
          Container(
            width: 128.0,
            height: 128.0,
            margin: const EdgeInsets.only(
              top: 24.0,
              bottom: 32.0,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.purple[50],
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://img-s1.onedio.com/id-546b4e03518b7eec3b2bf0c0/rev-0/raw/s-3d42376d9618160e5a8af20fc499179fe943a36b.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 35),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Gayeportakaldali@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilSayfa())),
            leading: Icon(Icons.home),
            title: Text('Profil'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Mesajlar())),
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Mesajlar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Eskifallar())),
            leading: Icon(Icons.favorite),
            title: Text('Eski Fallar'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Gesture())),
            leading: Icon(Icons.settings),
            title: Text('Gesture'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => KayitOl())),
            leading: Icon(Icons.home),
            title: Text('Kayıt/giriş Yap'),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnimasyonGrafik())),
            leading: Icon(Icons.home),
            title: Text('Grafik ve Animasyon'),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => VeriOkuma())),
            leading: Icon(Icons.home),
            title: Text('Veri okuma'),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => YeniWidgetler())),
            leading: Icon(Icons.home),
            title: Text('Yeni Widgetler'),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Falhakkinda())),
            leading: Icon(Icons.home),
            title: Text('Fal Hakkında'),
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 15,
              color: Colors.white54,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
