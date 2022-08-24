import 'dart:convert';
import 'package:bookstore/DataModel.dart';
import 'package:http/http.dart' as http;
class Dataservice {
  var data;
  Future<void> DataService(String? search) async {
    var endpoint = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$search&key=AIzaSyCzoYj4YTsWnevWoJvwgdd8TLlMoiyLgJ8");

    var response = await http.get(endpoint);
    print(response.body.toString());
    if(response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

}
