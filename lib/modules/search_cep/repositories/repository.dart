import '../../../shared/services/http_client.dart';
import '../models/cep_model.dart';

class HomeRepository {
  ClientHttp httpClient;

  HomeRepository(
    this.httpClient,
  );
  Future getData(String cep) async {
    var result = await httpClient.getData(cep);
    if (result.runtimeType != String) {
      var data = CepModel.fromJson(result);
      return data;
    } else {
      return result;
    }
  }
}
