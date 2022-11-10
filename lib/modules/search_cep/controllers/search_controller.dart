import 'package:flutter/widgets.dart';

import '../repositories/repository.dart';

class HomeController {
  final HomeRepository repository;

  HomeController(this.repository);

  TextEditingController fieldCep = TextEditingController();

  Future getCep(String cep) async {
    var result = await repository.getData(cep);

    return result;
  }
}
