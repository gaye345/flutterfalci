import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '/sabitler.dart';
import 'package:image_picker/image_picker.dart';

class Kahvefali extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Eski2(),
    );
  }
}

class Eski2 extends StatefulWidget {
  @override
  _Eski2State createState() => _Eski2State();
}

class _Eski2State extends State<Eski2> {
  final _advancedDrawerController = AdvancedDrawerController();
  File _secilenDosya;
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.purple[200],
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: null,
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          backgroundColor: canliFalRenk,
          title: const Text('Gizemli Falcı'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (context, value, child) {
                return Icon(
                  value.visible ? Icons.clear : Icons.menu,
                );
              },
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage:
                    _secilenDosya != null ? FileImage(_secilenDosya) : null,
                child: _secilenDosya == null ? Text("Fotograf") : null,
                radius: 50,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new ElevatedButton(
              child: Text("Foto yükle"),
              onPressed: () {
                _secimFotoGoster(context);
              },
            )
          ],
        ),
        drawer: SafeArea(
          child: Container(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      shape: BoxShape.circle,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home),
                    title: Text('Profil'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Mesajlar'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.favorite),
                    title: Text('Eski Fallar'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.settings),
                    title: Text('Kredi Kazan'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home),
                    title: Text('Paylaş'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.home),
                    title: Text('Fal Hakkında'),
                  ),
                  Spacer(),
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
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  void _secimFotoGoster(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Galeriden Foto Seç"),
              onTap: () {
                _secimYukle(ImageSource.gallery);
              },
            ),
            ListTile(
                title: Text("Kameradan Foto Çek"),
                onTap: () {
                  _secimYukle(ImageSource.camera);
                }),
          ],
        ),
      ),
    );
  }

  void _secimYukle(ImageSource source) async {
    final picker = ImagePicker();
    final secilen = await picker.getImage(source: source);
    setState(() {
      if (secilen != null) {
        _secilenDosya = File(secilen.path);
      }
    });
    Navigator.pop(context);
  }
}
