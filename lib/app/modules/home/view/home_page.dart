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
      appBar: AppBar(
        title: const Center(child: Text('Valorant')),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(150, 104, 104, 104),
                  Color.fromARGB(255, 73, 73, 73),
                  Color.fromARGB(255, 14, 13, 13),
                  Color.fromARGB(255, 202, 39, 39),
                  Color.fromARGB(255, 146, 0, 0),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller.counter,
            builder: (context, value, Widget? child) {
              return GridView.count(
                  padding: const EdgeInsets.all(8),
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        hoverElevation: 20,
                        heroTag: 'agents',
                        child: const Text(
                          'Agents',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/agents');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        hoverElevation: 20,
                        heroTag: 'Maps',
                        child: const Text(
                          'Maps',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/maps');
                        },
                      ),
                    ),
                  ]);
            },
          ),
        ],
      ),
    );
  }
}
