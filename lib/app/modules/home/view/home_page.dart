import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/modules/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: controller.counter,
        // linha acima será o a variável que será ouvida
        builder: (context, value, Widget? child) {
          /// acima temos os parametros: context, value e child.
          ///
          /// context serve para passar o contexto atual da arvore de widgets
          /// que o flutter montou.
          ///
          /// value corresponde ao valor da variável que está sendo ouvida,
          /// nesse caso, o valor de counter declarado no controller.
          ///
          /// child, geralmente não usamos, á nao ser que queira fazer o build
          /// de um widget durante alteracao do valor da variável.
          /// ... Não recomendo.
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$value',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCounter,
        // chamada de funções podem ser como na linha acima, ou como abaixo
        // onPressed: () {
        //   controller.incrementCounter();
        // },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
