import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/sabitler.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class GirisYap extends StatefulWidget {
  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String userEmail;
  bool _success;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
        backgroundColor: girisYapRenk,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Lütfen boş geçmeyin";
                  } else {
                    if (value.length < 3) {
                      return "Lütfen en az 3 harf giriniz";
                    } else {
                      return null;
                    }
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelText: "E-posta Adresi",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Şifre",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Lütfen boş geçmeyin";
                    } else {
                      if (value.length < 3) {
                        return "Lütfen en az 3 harf giriniz";
                      } else {
                        return null;
                      }
                    }
                  }),
            ),
            MaterialButton(
              child: Text("Şifremi Unuttum"),
              onPressed: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: _girisYap,
                      child: Text('Giriş yap'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GirisYap()));
                      },
                      child: Text('Üye ol'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    _success == null
                        ? ''
                        : (_success
                            ? 'Successfully signed in ' + userEmail
                            : 'Sign in failed'),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  _girisYap() async {
    if (formKey.currentState.validate()) {
      try {
        if (_auth.currentUser == null) {
          var oturumAc = (await _auth.signInWithEmailAndPassword(
                  email: email.text, password: password.text))
              .user;
          if (oturumAc != null) {
            setState(() {
              _success = true;
              print('Oturum açıldı');
              userEmail = oturumAc.email;
            });
          } else {
            print('Oturum açılamadı');
            setState(() {
              _success = false;
            });
          }
        }
      } catch (e) {
        print('Hata çıktı ' + e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.error),
                Text('Giriş hatası'),
              ],
            ),
          ),
        );
      }
    }
  }
}
