// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class ClientHttp {
  Future getData(String cep) async {
    var fragmentUrl = '$cep/json';
    http.Response response =
        await http.get(Uri.parse(ApiCep.urlBase + fragmentUrl));
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return jsonDecode(response.body);
    } else {
      debugPrint(response.statusCode.toString());
      return response.statusCode.toString();
    }
  }
}
