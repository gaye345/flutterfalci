import 'dart:convert';
import 'package:http/http.dart' as http;
import 'albums.dart';

Future<List<Album>> getAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Album.fromJson(data)).toList();
  } else {
    throw Exception('Bir hata oluştu.');
  }
}
