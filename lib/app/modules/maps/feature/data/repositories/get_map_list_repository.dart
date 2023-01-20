import 'package:dio/dio.dart';
import 'package:valorant_flutter/app/modules/home/feature/data/models/map_model.dart';
import 'package:valorant_flutter/app/modules/home/feature/data/models/response_map_list_model.dart';

class GetMapListRepository {
  // essa variável chama-se de httpDioClient, pois o dio é um 'client' ou seja
  // um serviço que realiza chamadas http.
  // chamadas http são chamadas feitas por vias de protocolo de comunicação
  // de rede chamdado http . para saber mais visite > https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Overview

  // as chamadas http podem ser feitas para um servidor que contenha uma conexão
  // á um banco de dados e dependendo do tipo da chamada o sistema ou interface
  // (nesse caso API) fazer...
  // 1 consultas ao banco > daí chamamos de método GET
  // 2 enviar novo registro ao banco > chamado de método POST
  // 3 deletar registro no banco > chamado de DELETE
  // 4 ou alterar um registro > chamado de PUT ou PATCH
  // voce pode observar que, ao instanciar o dio e chamar seus métodos consegue
  // visualizar todos, por exemplo:
  // httpDioClient.get()
  // httpDioClient.post()
  // etc ...
  final httpDioClient = Dio();

  Future<List<MapModel>?> call() async {
    // essa variável se chama de response, pois ao fazer um requisição via
    //  protocolo http, sempre voce terá uma resposta do servico.
    // ou seja terá um response. que virá como String ou no formato de arquivo
    // JSON.
    final response =
        await httpDioClient.get('https://valorant-api.com/v1/maps');

    // ao terminar a requisiçao e a API retornar os dados, o response terá
    // um objeto chamado de DATA. esse objeto contém o json com os dados
    // requeridos.

    //  nesse caso da api do valorante, ela retorna um json (ou seja, um map)
    // com um campo "status", que trás informação do código de resposta.
    // e outro campo "data", que trás os dados com a lista de mapas.
    // para nosso caso de uso,só interessa o campo com os dados da lista de maps
    // por isso vamos criar mais uma varriável para separar esses dados.
    // primeiro modelar os dados do map em um objeto dart. e depois retornar
    // o objeto ja com os dados que precisamos.

    // essa variavel guarda o objeto modelado a partir do json do response.
    // esse model (ResponseMapListModel) é modelado a partir do json completo
    // ou seja, contém todos os dados.
    // exemplo... no json temos o seguinte:
    /*
    {
      "status": 200, >>> informação do código de resposta
      "data": [....] >>> dados com a lista de mapas
    } 
    */
    // após a modelagem conseguimos acessar todos esses dados a partir da Model
    // dessa forma por exemplo:
    /* 
      final model = ResponseMapListModel.fromMap(response.data);

      print(model.status); >> printa o código de resposta
      print(model.data);   >> printa a lista de mapas
    */
    final responseMapListModel = ResponseMapListModel.fromMap(response.data);

    // essa variável pega a partir do model acima, somente os dados que precisamos
    // ou seja, a list de mapas
    final result = responseMapListModel.data;

    return result;
  }
}
