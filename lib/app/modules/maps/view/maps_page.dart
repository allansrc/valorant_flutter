import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/modules/home/controller/home_controller.dart';
import 'package:valorant_flutter/app/modules/maps/controller/maps_controller.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  final controller = MapsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller.counter,
        builder: (context, value, Widget? child) {
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
