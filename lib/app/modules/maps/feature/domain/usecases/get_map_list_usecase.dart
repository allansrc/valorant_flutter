import 'package:valorant_flutter/app/modules/home/feature/data/models/map_model.dart';
import 'package:valorant_flutter/app/modules/maps/feature/data/repositories/get_map_list_repository.dart';

// classe que define a funçao que irá chamar o repository, para o repository
// fazer a chamada na API e retornar o dado necessário requerido

// usecase é o que chamamos de CASO DE USO.
// ou seja, nesse exemplo, temos um caso de uso de uma chamada de lista de mapas
class GetMapListUsecase {
  final repository = GetMapListRepository();
  Future<List<MapModel>> call() async {
    final mapListResult = await repository.call();

    // checa se o dado está vindo nulo
    if (mapListResult != null) {
      // se for diferente de nulo ele retorna a lista vinda da api
      return mapListResult;
    } else {
      // caso contrário, retorna uma lista vazia
      return <MapModel>[];
    }

    // o mesmo check acima com if .. else, poderia ser feito da seguinte forma:
    // return mapListResult ?? <MapModel>[];
  }
}
