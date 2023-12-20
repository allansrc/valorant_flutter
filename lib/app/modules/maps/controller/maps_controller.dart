import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../home/feature/data/models/map_model.dart';
import '../feature/domain/usecases/get_map_list_usecase.dart';

class MapsController extends ChangeNotifier {
  // variáveis de serviços que vamos usar, por exemplo, fazer chamada na API
  final getMapListUsecase = GetMapListUsecase();

  // Variáveis locais, usadas para armazenar dados que vamos usar na view/page
  final mapList = ValueNotifier<List<MapModel>>([]);

  Future<void> getMapList() async {
    final result = await getMapListUsecase.call();
    mapList.value = result;
    notifyListeners();
    // a linha 32, faz a chamada no usecase, que irá chamar o serviço da API
    // a linha 33 atribui o valor retornado á variável mapList, que vamos usar
    // na view/page.
    // a linha 34 faz com que todo widget que esteja "ouvindo" essa variável
    // seja notificado que ela foi alterada, e se for preciso ele (o widget)
    //  atualize os valores que estao sendo mostrado na tela.
  }
}
