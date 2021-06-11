import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.brown,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Anasayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoriler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_upload),
          label: 'Dosyalar',
        ),
      ],
    );
  }
}
