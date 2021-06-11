import 'package:flutter/material.dart';
import '/sabitler.dart';

class Gesture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
        backgroundColor: gestureRenk,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => print("Icon Button Tıklandı"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: GestureDetector(
                onLongPress: () {
                  print('onLong uygulandı.');
                },
                child: Center(
                  child: Text(
                    'onLong',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: GestureDetector(
                onTap: () {
                  print('onTap uygulandı.');
                },
                child: Center(
                  child: Text(
                    'onTap',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: GestureDetector(
                onDoubleTap: () {
                  print('onDoubleTap uygulandı.');
                },
                child: Center(
                  child: Text(
                    'onDoubleTap',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: GestureDetector(
                onLongPressUp: () {
                  print('onLongPressUp uygulandı.');
                },
                child: Center(
                  child: Text(
                    'onLongPressUp',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              child: GestureDetector(
                onSecondaryLongPress: () {
                  print('onSecondaryLongPress uygulandı.');
                },
                child: Center(
                  child: Text(
                    'onSecondaryLongPress',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
