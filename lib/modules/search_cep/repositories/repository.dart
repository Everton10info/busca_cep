import '../../../shared/services/http_client.dart';
import '../models/cep_model.dart';

class HomeRepository {
  ClientHttp httpClient;

  HomeRepository(
    this.httpClient,
  );
  Future getData(String cep) async {
    var result = await httpClient.getData(cep);
    var data = CepModel.fromJson(result);
    //  debugPrint(data.cep);
    return data;
  }
}
