import 'dart:convert';

import '../../../shared/services/api.dart';
import '../models/cep_model.dart';

import 'package:http/http.dart' as http;

class HomeRepository {
  Future getData(String cep) async {
    final response = await http.get(Uri.parse('${ApiCep.urlBase}$cep/json'));
    if (response.statusCode == 200) {
      return CepModel.fromJson(jsonDecode(response.body));
    } else {
      return 'Servidor indisponível, tente novamente mais tarde';
    }
  }
}
