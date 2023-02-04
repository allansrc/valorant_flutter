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
// mapList lista completa de maps
// mapList.elementAt(index): item no indice da lista
// mapList[index]:  mesma coisa da linha acima
// MapModel = objeto

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return FinalPage(
                                  tag: '${mapList.elementAt(index).uuid}',
                                  splash: '${mapList.elementAt(index).splash}',
                                  coordinates:
                                      '${mapList.elementAt(index).coordinates}',
                                  displayName:
                                      '${mapList.elementAt(index).displayName}',
                                  displayIcon:
                                      '${mapList.elementAt(index).displayIcon}',
                                );
                              }),
                            );
                          },
                          child: Hero(
                            tag: '${mapList.elementAt(index).uuid}',
                            child: Stack(
                              children: <Widget>[
                                SizedBox(
                                    child: Image.network(
                                        '${mapList.elementAt(index).splash}')
                                    // a linha acima é o mesmo que fazer > '${mapList[inde].displayName}'
                                    ),
                                Text(
                                  '${mapList.elementAt(index).displayName}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
        heroTag: 'get',
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

class FinalPage extends StatelessWidget {
  final String tag;
  final String splash;
  final String displayName;
  final String coordinates;
  final String displayIcon;
  const FinalPage({
    super.key,
    required this.tag,
    required this.splash,
    required this.displayName,
    required this.coordinates,
    required this.displayIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Scaffold(
        appBar: AppBar(
          title: Text(displayName),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(splash),
                  Center(child: Text(coordinates)),
                ],
              ),
            ),
            Flexible(
              child: Image.network(displayIcon == 'null'
                  ? 'https://media.valorant-api.com/themes/5b5a21ad-46a8-2e3f-f4c5-6c8c7392be69/displayicon.png'
                  : displayIcon),
            ),
          ],
        ),
      ),
    );
  }
}
