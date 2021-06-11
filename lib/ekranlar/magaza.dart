import 'package:flutter/material.dart';
import '/sabitler.dart';

class Magaza extends StatefulWidget {
  @override
  _MagazaState createState() => _MagazaState();
}

class _MagazaState extends State<Magaza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: magazaRenk,
      drawer: Drawer(
        child: ListView(
          children: [
            myDraweritem(
                Icons.label_important_outline, "Profil", "/bildirimler"),
            myDraweritem(
                Icons.label_important_outline, "Mesajlar", "/bildirimler"),
            myDraweritem(
              Icons.label_important_outline,
              "Kredi Yükle",
              "/bildirimler",
            ),
            myDraweritem(
                Icons.label_important_outline, "Eski Fallar", "/bildirimler"),
            myDraweritem(
              Icons.label_important_outline,
              "Ayarlar",
              "/bildirimler",
            ),
            myDraweritem(
                Icons.label_important_outline, "Üyelik", "/bildirimler"),
            myDraweritem(
                Icons.label_important_outline, "Kredi Kazan", "/bildirimler"),
            myDraweritem(
                Icons.label_important_outline, "Mağaza", "/bildirimler"),
            myDraweritem(
                Icons.label_important_outline, "Yardim", "/bildirimler"),
            myDraweritem(
                Icons.label_important_outline, "Canli Fal", "/bildirimler"),
            myDraweritem(Icons.label_important_outline, "Kahve Falı Hakkında",
                "/bildirimler"),
            myDraweritem(
                Icons.label_important_outline, "Paylaş", "/bildirimler"),
            myDraweritem(Icons.label_important_outline, "Kullanıcı Sözleşmesi",
                "/bildirimler"),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Gizemli Falci",
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.purple[600],
      ),
      body: Center(
        child: new GridView.count(
          primary: false,
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          children: [
            new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/ruya.jpg'),
                ),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/kahvefali.png'),
                ),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/magaza.jpg'),
                ),
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/magaza.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myDraweritem(
    IconData icon,
    String title,
    String routename,
  ) =>
      ListTile(
        tileColor: Colors.purple[600],
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontFamily: 'Roboto'),
        ),
        onTap: () => Navigator.pushNamed(context, routename),
      );
}
