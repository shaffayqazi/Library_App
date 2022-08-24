import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Bookshelper{
  final String key = 'AIzaSyCzoYj4YTsWnevWoJvwgdd8TLlMoiyLgJ8';
  final String Query = "volumes?q=";
  final String base = 'https://www.googleapis.com/books/v1/';

  Future<List<dynamic>> getBooks(String query) async {
    final String url = base + query + key;
    Response result= await http.get(url);
  }

}