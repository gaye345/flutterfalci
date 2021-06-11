import 'package:flutter/material.dart';
import '/sabitler.dart';

class YeniWidgetler extends StatefulWidget {
  @override
  _YeniWidgetlerState createState() => _YeniWidgetlerState();
}

class _YeniWidgetlerState extends State<YeniWidgetler> {
  bool flutter = false;
  bool reactNative = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('yeni widgetler'),
        backgroundColor: yeniWidgetlerRenk,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return List.generate(5, (index) {
                return PopupMenuItem(
                  child: Text('Button ${index + 1}'),
                );
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: PageView(
        children: [
          Form(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Flutter'),
                        Checkbox(
                            value: flutter,
                            onChanged: (deger) {
                              setState(() {
                                flutter = deger;
                              });
                            }),
                        Text('React Native'),
                        Checkbox(
                            value: reactNative,
                            onChanged: (deger) {
                              setState(() {
                                reactNative = deger;
                              });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                width: 200,
                height: 250,
                child: Material(
                  elevation: 0,
                  color: Colors.black,
                  animationDuration: Duration(seconds: 10),
                  borderRadius: BorderRadius.circular(22),
                  child: Card(
                    color: Colors.yellow,
                    child: Center(
                      child: Text('Yeni Widgetler'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 77,
                child: Container(
                  margin: EdgeInsets.all(12),
                  width: 200,
                  height: 250,
                  child: Material(
                    elevation: 0,
                    color: Colors.black,
                    animationDuration: Duration(seconds: 10),
                    borderRadius: BorderRadius.circular(22),
                    child: Card(
                      color: Colors.green,
                      child: Center(
                        child: Text('Yeni Widgetler'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 144,
                child: Container(
                  margin: EdgeInsets.all(12),
                  width: 200,
                  height: 250,
                  child: Material(
                    elevation: 0,
                    color: Colors.black,
                    animationDuration: Duration(seconds: 10),
                    borderRadius: BorderRadius.circular(22),
                    child: Card(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Yeni Widgetler'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 144,
                child: Container(
                  margin: EdgeInsets.all(12),
                  width: 200,
                  height: 250,
                  child: Material(
                    elevation: 0,
                    color: Colors.black,
                    animationDuration: Duration(seconds: 10),
                    borderRadius: BorderRadius.circular(22),
                    child: Card(
                      color: Colors.purple,
                      child: Center(
                        child: Text('Yeni Widgetler'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 144,
                left: 77,
                child: Container(
                  margin: EdgeInsets.all(12),
                  width: 200,
                  height: 250,
                  child: Material(
                    elevation: 0,
                    color: Colors.black,
                    animationDuration: Duration(seconds: 10),
                    borderRadius: BorderRadius.circular(22),
                    child: Card(
                      color: Colors.orange,
                      child: Center(
                        child: Text('Yeni Widgetler'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 144,
                left: 144,
                child: Container(
                  margin: EdgeInsets.all(12),
                  width: 200,
                  height: 250,
                  child: Material(
                    elevation: 0,
                    color: Colors.black,
                    animationDuration: Duration(seconds: 10),
                    borderRadius: BorderRadius.circular(22),
                    child: Card(
                      color: Colors.red,
                      child: Center(
                        child: Text('Yeni Widgetler'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Expanded - Tabbar'),
                backgroundColor: Colors.indigo,
                bottom: TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.home_filled),
                    text: 'Anasayfa',
                  ),
                  Tab(
                    icon: Icon(Icons.help),
                    text: 'Hakkımızda',
                  ),
                  Tab(
                    icon: Icon(Icons.contact_page),
                    text: 'İletişim',
                  ),
                ]),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: ListView.builder(
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return Text(index.toString());
                          }),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  width: 300,
                  height: 300,
                  color: Colors.yellow,
                  child: Center(child: Text('Single Child Scroll View')),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  width: 300,
                  height: 300,
                  color: Colors.brown,
                  child: Center(child: Text('Single Child Scroll View')),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  width: 300,
                  height: 300,
                  color: Colors.blueGrey,
                  child: Center(child: Text('Single Child Scroll View')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
