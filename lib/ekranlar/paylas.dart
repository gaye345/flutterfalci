import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '/sabitler.dart';
import 'eski_fallar.dart';
import 'gesture.dart';
import 'mesajlar.dart';

class Paylas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Paylas1(),
    );
  }
}

class Paylas1 extends StatefulWidget {
  @override
  _Paylas1State createState() => _Paylas1State();
}

class _Paylas1State extends State<Paylas1> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.purple[200],
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        backgroundColor: paylasRenk,
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text('Paylaş'),
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
        body: Column(),
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
                  //child: Image.asset(
                  // 'assets/images/flutter_logo.png',
                ),
                //),

                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Profil'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mesajlar()));
                  },
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Mesajlar'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Eskifallar()));
                  },
                  leading: Icon(Icons.favorite),
                  title: Text('Eski Fallar'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Gesture()));
                  },
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
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
