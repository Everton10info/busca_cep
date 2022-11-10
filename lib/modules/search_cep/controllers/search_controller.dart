import 'package:busca_cep/modules/search_cep/models/cep_model.dart';
import 'package:flutter/widgets.dart';

import '../repositories/repository.dart';

class HomeController {
  final HomeRepository repository;

  HomeController(this.repository);

  TextEditingController fieldCep = TextEditingController();

  Future<CepModel> getCep(String cep) async {
    var result = await repository.getData(cep);

    return result;
  }
}
