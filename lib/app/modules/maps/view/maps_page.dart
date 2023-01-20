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
        valueListenable: controller.mapList,
        builder: (context, mapList, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: mapList.length,
                      itemBuilder: (context, index) {
                        return Text(
                          '${mapList.elementAt(index).displayName}',
                          // a linha acima é o mesmo que fazer > '${mapList[inde].displayName}'
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.getMapList();
                    },
                    child: const Text('Buscar lista da Mapas'),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.mapList.value.clear();
          setState(() {});
        },
        tooltip: 'Limpar lista de Maps',
        child: const Icon(Icons.cleaning_services_sharp),
      ),
    );
  }
}
