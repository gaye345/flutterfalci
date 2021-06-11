import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gizemli_falci/islemler/Giris_yap.dart';
import 'package:gizemli_falci/sabitler.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class KayitOl extends StatefulWidget {
  @override
  _KayitOlState createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kayitOlRenk,
        title: Text('Üye Ol'),
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
                      onPressed: _kayitOl,
                      child: Text('Üye ol'),
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
                      child: Text('Giriş Yap'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _kayitOl() async {
    if (formKey.currentState.validate()) {
      try {
        var authResult = await _auth
            .createUserWithEmailAndPassword(
              email: email.text,
              password: password.text,
            )
            // ignore: invalid_return_type_for_catch_error
            .catchError((e) => debugPrint("Hata :" + e.toString()));
        var firebaseUser = authResult.user;
        if (firebaseUser != null) {
          firebaseUser.sendEmailVerification().then((data) => _auth.signOut());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.approval_rounded),
                Text('Kayıt başarılı. Lütfen mail adresinizi doğrulayın'),
              ],
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ));
        }
      } catch (e) {
        print("hata çıktı.");
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.error),
                Text('Kayıt hatası'),
              ],
            ),
          ),
        );
      }
    }
  }
}
