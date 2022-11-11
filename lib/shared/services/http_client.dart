import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api.dart';

class ClientHttp {
  Future getData(String cep) async {
    var fragmentUrl = '$cep/json';

    try {
      http.Response response =
          await http.get(Uri.parse(ApiCep.urlBase + fragmentUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return 'Cep não encontratado';
      }
    } catch (e) {
      return 'Sevidor não está respondendo, tente mais tarde!';
    }
  }
}
