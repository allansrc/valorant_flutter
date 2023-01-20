import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MapsController extends ChangeNotifier {
  final mapList = ValueListenable<>();
  final counter = ValueNotifier<int>(0);
  // linha acima transforma a variável counter do tipo inteiro
  // em um listenable: ou seja, ela poderá ser "ouvida" por widgets
  // dessa forma não será necessário usar o método setState(() {}) para
  // a tela ser atualizada.

  // Para ver exemplo de uma função de incremento/soma de inteiros
  // abrir o arquivo main, o qual usa setState(() {}) para atualizar o estado
  // da tela. Dica: esperimente remover o setState, e tentar usar o botão +
  // depois faça hot restart.

  void incrementCounter() {
    counter.value++;
    // linha acima atribui novo valor á variável counter
    counter.notifyListeners();
    // método acima atualiza o widget que usar o valor counter
  }

  void getMapList() {}
}
