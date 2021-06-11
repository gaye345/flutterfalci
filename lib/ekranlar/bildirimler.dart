import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '/models/albums.dart';
import '/models/getAlbum.dart';
import '/sabitler.dart';
import '/widgetler/drawerWidget.dart';
import '../widgetler/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math' as math;

class Bildirimler extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Hata çıktı ' + snapshot.error.toString()),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Homeb();
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class Homeb extends StatefulWidget {
  @override
  _HomebState createState() => _HomebState();
}

class _HomebState extends State<Homeb> {
  final _advancedDrawerController = AdvancedDrawerController();
  Future<List<Album>> album;
  @override
  void initState() {
    super.initState();
    album = getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.black87,
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
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bildirimlerRenk,
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
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.8),
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
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: BottomBar(),
      ),
      drawer: DrawerWidget(),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
